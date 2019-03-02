/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include "stdio.h"
#include "platform.h"
#include "ADXL362.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xintc.h"
#include "xtmrctr.h"
#include "xil_exception.h"
#include "math.h"
#include "xtft.h"
#include "time.h"
#include "stdlib.h"
#include "gameover.h"

typedef struct people{
	int x, y, speed;
}PEOPLE;

typedef struct block{
	int x, y;
	struct block *next;
}BLOCK;

/*****************************************************************************/
/************************ Functions Declarations *****************************/
/*****************************************************************************/

void uartIntHandler(void);
void ShowScore();
int ReadAcc(char axis);
void Initialize();
void GameInitialize();
void DrawWelcomeWord();
int RandBlock(int width);
void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber);
void DrawGameOver();
BLOCK *CreateNewBlock(int line);
void CalculatePeopleSpeed(PEOPLE *p);
void RemoveOldPeople(PEOPLE *p);
void DrawNewPeople(PEOPLE *p);
void RemoveOldBlock(BLOCK *b);
void DrawNewBlock(BLOCK *b);
void Gaming();
void ClearScreen();


/*****************************************************************************/
/********************** Variable Definitions *********************************/
/*****************************************************************************/
#define XPAR_SEG_0_BASEADDR		XPAR_GPIO_0_BASEADDR
#define IMRCTR_DEVICE_ID		XPAR_TMRCTR_0_DEVICE_ID
#define INTC_DEVICE_ID 			XPAR_INTC_0_DEVICE_ID
#define TMRCTR_INTERRUPT_ID		XPAR_INTC_0_TMRCTR_0_VEC_ID
#define TIMER_CNTR_0 			0
#define RESET_VALUE 			1000000
#define SCREEN_WIDTH			640
#define SCREEN_HEIGHT			480
#define TFT_DEVICE_ID			XPAR_TFT_0_DEVICE_ID
#define TFT_FRAME_ADDR0			XPAR_XPS_MCH_EMC_0_MEM0_HIGHADDR - 0x001FFFFF

#define TFT_RED					0xE0
#define TFT_GREEN				0x1C
#define TFT_BLUE				0x03
#define TFT_BLACK				0x00
#define TFT_WHITE				0xFF
#define PEOPLE_WIDTH 			2
#define PEOPLE_HEIGHT 			4
#define BLOCK_WIDTH				15
#define BLOCK_HEIGHT			1
#define PEOPLE_COLOR			TFT_RED
#define BLOCK_COLOR				TFT_WHITE
#define BACKGROUND_COLOR		TFT_BLACK
#define PADDING_LEFT			5
#define PADDING_RIGHT			5
#define PADDING_TOP				5
#define PADDING_BOTTOM			5
#define BLOCK_DENSITY_DEFAULT	85
#define GAME_SPEED_DEFAULT		2
#define GRAVITY					1
#define ACC_SENSITY				70
#define MAX_SPEED_DEFAULT		4
#define GAMEOVER_IMG_WIDTH		640
#define GAMEOVER_IMG_HEIGHT		360

int numbers[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

XIntc InterruptController;
XTmrCtr TimerCounterInst;
XTft TftInstance;
XTft_Config *TftConfigPtr;

u16 pos = 0xFF7F;
int accX = 0, accY = 0, accZ = 0;
BLOCK *first;
volatile _Bool isAlive;
PEOPLE *me;
u8 welcomeWord[] = {'W','e','l','c','o','m','e','!'};
u8 welcomeWord1[] = {'T','h','e',' ','G','a','m','e',' ','w','i','l','l',' ','s','t','a','r','t',' ','i','n'};
u8 welcomeWord2[] = {'s','e','c','o','n','d','s'};
int score = 0;
int BLOCK_DENSITY = BLOCK_DENSITY_DEFAULT;
int MAX_SPEED = MAX_SPEED_DEFAULT;
int GAME_SPEED = GAME_SPEED_DEFAULT;
//u8 GameSpeed = 1;

/******************************************************************************
* @brief Main function.
*
* @return Always returns 0.
******************************************************************************/
void print(char *str);

int main()
{
	Initialize();
	GameInitialize();
	while(1)
	{
		while(isAlive)
		{
			Gaming();
		}
		DrawGameOver();
		delay_ms(2000);
		GameInitialize();
	}
	Xil_DCacheDisable();
	Xil_ICacheDisable();
	return 0;
}

/******************************************************************************
* @brief Interrupt Handler for UART.
*
* @return None.
******************************************************************************/
void uartIntHandler(void)
{
	if(Xil_In32(XPAR_RS232_BASEADDR + 0x08) & 0x01)
	{
		//rxData = Xil_In32(XPAR_RS232_BASEADDR);
	}
}

void ShowScore()
{
	int position, p = 100000;
	for (position = 0; position < 4; position++){
		delay_ms(1);
		Xil_Out8(XPAR_SEG_0_BASEADDR + 0x8, pos);	//输入位码
		Xil_Out8(XPAR_SEG_0_BASEADDR, numbers[(score / p) % 10]);	//输入段码
		p = p / 10;
		pos = pos >> 1;
	}
	pos = 0xFF7F;
}

int ReadAcc(char axis)
{
	int 	rxG 		= 0;
	char 	sign 		= 0;
//	float 	value 		= 0;
//	int 	whole 		= 0;
//	int 	thousands 	= 0;

	switch(axis)
	{
		case 'x':
			rxG = ADXL362_ReadX();
			break;
		case 'y':
			rxG = ADXL362_ReadY();
			break;
		case 'z':
			rxG = ADXL362_ReadZ();
			break;
		default:
			break;
	}

	// Sign is MSB. If 1 . Negative Number, else Positive Number
	sign = (rxG & 0x800) >> 11;

	if (sign == 1)
	{
		// If negative number, padding with FFFFF MSB's
		rxG = rxG | 0xFFFFF000;
	}
	else
	{
		rxG = rxG | 0x00000000;
	}

//	value = ((float)rxG / 1000);
//
//	if(rxG >= 0)
//	{
//		whole = value;
//		thousands = (value - whole) * 1000;
//	}
//	else
//	{
//		value = value * (-1);
//		whole = value;
//		thousands = (value - whole) * 1000;
//	}

	//ADXL362_Display(whole, thousands, sign, 0);
	return rxG;
}

void Initialize(){
	Xil_ICacheEnable();
	Xil_DCacheEnable();

	// Enable Interrupts
	//microblaze_register_handler((XInterruptHandler)uartIntHandler, (void *)0);

	//注册中断服务
	microblaze_register_handler((XInterruptHandler)XIntc_InterruptHandler, &InterruptController);
	//使MicroBlaze微处理器响应外部中断
	microblaze_enable_interrupts();

	//开放GPIO输出
	Xil_Out8(XPAR_SEG_0_BASEADDR+0x4,0x0);

	//开放GPIO2输出
	Xil_Out8(XPAR_SEG_0_BASEADDR+0xc,0x0);

	//初始化定时器
	XTmrCtr_Initialize(&TimerCounterInst,IMRCTR_DEVICE_ID);

	//初始化中断控制器
	XIntc_Initialize(&InterruptController, INTC_DEVICE_ID);

	//将定时器主中断服务程序注册到相应Intr引脚对应的中断向量
	XIntc_Connect(&InterruptController, TMRCTR_INTERRUPT_ID,(XInterruptHandler)XTmrCtr_InterruptHandler,(void *)&TimerCounterInst);
	//XIntc_Connect(&InterruptController, 1,(XInterruptHandler)uartIntHandler, NULL);

	//设置中断控制器接受硬件中断申请
	XIntc_Start(&InterruptController, XIN_REAL_MODE);

	//开放相应引脚中断请求
	XIntc_Enable(&InterruptController, TMRCTR_INTERRUPT_ID);
	//XIntc_Enable(&InterruptController, 1);

	//注册定时器中断服务程序
	XTmrCtr_SetHandler(&TimerCounterInst, TimerCounterHandler, &TimerCounterInst);

	//设置定时器：允许中断、自动装载、减记数
	XTmrCtr_SetOptions(&TimerCounterInst, TIMER_CNTR_0, XTC_INT_MODE_OPTION|XTC_AUTO_RELOAD_OPTION|XTC_DOWN_COUNT_OPTION);

	//设置初始计数值
	XTmrCtr_SetResetValue(&TimerCounterInst, TIMER_CNTR_0,RESET_VALUE);

	//启动定时器
	XTmrCtr_Start(&TimerCounterInst, TIMER_CNTR_0);

	//设置加速度计
	Xil_Out32(XPAR_RS232_BASEADDR+0xC, (1 << 4));

	// Initialize SPI
	SPI_Init(XPAR_SPI_0_BASEADDR, 0, 0, 0);

	// Software Reset
	ADXL362_WriteReg(ADXL362_SOFT_RESET, ADXL362_RESET_CMD);
	delay_ms(10);
	ADXL362_WriteReg(ADXL362_SOFT_RESET, 0x00);

	// Enable Measurement
	ADXL362_WriteReg(ADXL362_POWER_CTL, (2 << ADXL362_MEASURE));

	//ADXL362_DisplayMainMenu();

	//初始化TFTConfig
	TftConfigPtr=XTft_LookupConfig(TFT_DEVICE_ID);
	//初始化TFT
	XTft_CfgInitialize(&TftInstance, TftConfigPtr, TftConfigPtr->BaseAddress);
	//设置TFT的存储基地址
	XTft_SetFrameBaseAddr(&TftInstance, TFT_FRAME_ADDR0);
	XTft_ClearScreen(&TftInstance);

	print("Hardware Initialized\n\r");
}

void GameInitialize()
{
	XTft_ClearScreen(&TftInstance);
	srand(time(NULL));
	score = 0;
	isAlive = TRUE;
	//初始化角色信息
	isAlive = TRUE;
	if(me != NULL) free(me);
	me = (PEOPLE *)malloc(sizeof(PEOPLE));
	me -> x = SCREEN_WIDTH / 2;
	me -> y = SCREEN_HEIGHT / 2;
	me -> speed = 0;
	DrawNewPeople(me);
	//生成初始砖块
	BLOCK *b = NULL;
	if(first != NULL) b = first;
	while(b != NULL)
	{
		b = first -> next;
		free(first);
		first = b;
	}
	first = (BLOCK *)malloc(sizeof(BLOCK));
	//第一块砖块在角色脚下
	first -> x = me -> x;
	first -> y = me -> y + PEOPLE_HEIGHT + BLOCK_HEIGHT + 1;
	int line;
	b = first;
	for (line = me -> y + PEOPLE_HEIGHT * 3 + BLOCK_HEIGHT * 3 + 2; line < SCREEN_HEIGHT - PADDING_TOP - PADDING_BOTTOM - 1; line += BLOCK_HEIGHT * 2 + 1)
	{
		BLOCK *new = CreateNewBlock(line);
		if(new != NULL)
		{
			b -> next = new;
			b = b -> next;
			line += BLOCK_HEIGHT * 2 + PEOPLE_HEIGHT * 2 + 2;
		}
	}
	print("Block Initialized\n\r");
	//画出砖块
	b = first;
	while(b != NULL)
	{
		//xil_printf("X:%d, Y:%d\n\r", p -> x,p -> y);
		DrawNewBlock(b);
		b = b -> next;
	}
	//画出四周边界
	XTft_FillScreen(&TftInstance, 0, 0, SCREEN_WIDTH - 1, PADDING_TOP - 1, TFT_GREEN);//top
	XTft_FillScreen(&TftInstance, 0, 0, PADDING_LEFT - 1, SCREEN_HEIGHT - 1, TFT_GREEN);//left
	XTft_FillScreen(&TftInstance, SCREEN_WIDTH - PADDING_RIGHT - 1, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1, TFT_GREEN);//right
	XTft_FillScreen(&TftInstance, 0, SCREEN_HEIGHT - PADDING_BOTTOM - 1, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1, TFT_GREEN);//bottom
	print("Game Initialized\n\r");
	DrawWelcomeWord();
}

void DrawWelcomeWord()
{
	int line, col, count;
	XTft_SetPos(&TftInstance, SCREEN_WIDTH / 2 - sizeof(welcomeWord) / sizeof(u8) * XTFT_CHAR_WIDTH / 2, SCREEN_HEIGHT / 4);
	for (col = 0; col < sizeof(welcomeWord) / sizeof(u8); col ++){
		XTft_SetColor(&TftInstance, TFT_WHITE, BACKGROUND_COLOR);
		XTft_Write(&TftInstance, welcomeWord[col]);
	}
	XTft_SetPos(&TftInstance, SCREEN_WIDTH / 2 - sizeof(welcomeWord1) / sizeof(u8) * XTFT_CHAR_WIDTH / 2, SCREEN_HEIGHT / 4 + XTFT_CHAR_HEIGHT + 2);
	for (col = 0; col < sizeof(welcomeWord1) / sizeof(u8); col ++){
		XTft_SetColor(&TftInstance, TFT_WHITE, BACKGROUND_COLOR);
		XTft_Write(&TftInstance, welcomeWord1[col]);
	}
	XTft_SetPos(&TftInstance, SCREEN_WIDTH / 2 - sizeof(welcomeWord2) / sizeof(u8) * XTFT_CHAR_WIDTH / 2, SCREEN_HEIGHT / 4 + XTFT_CHAR_HEIGHT * 3 + 6);
	for (col = 0; col < sizeof(welcomeWord2) / sizeof(u8); col ++){
		XTft_SetColor(&TftInstance, TFT_WHITE, BACKGROUND_COLOR);
		XTft_Write(&TftInstance, welcomeWord2[col]);
	}
	for (count = 3; count >= 0; count--)
	{
		XTft_SetPos(&TftInstance, (SCREEN_WIDTH - XTFT_CHAR_WIDTH) / 2 - 1, SCREEN_HEIGHT / 4 + XTFT_CHAR_HEIGHT * 2 + 4);
		XTft_SetColor(&TftInstance, TFT_WHITE, BACKGROUND_COLOR);
		XTft_Write(&TftInstance, (u8)count + 0x30);
		delay_ms(500);
	}
	for (line = SCREEN_HEIGHT / 4; line <= SCREEN_HEIGHT / 4 + XTFT_CHAR_HEIGHT * 5; line++)
	{
		for (col = 100; col <= 500; col++)
		{
			XTft_SetPixel(&TftInstance, col, line, BACKGROUND_COLOR);
		}
	}
}

int RandBlock(int width)
{
	int randomnum = rand() % 100;
	if(randomnum > BLOCK_DENSITY)
	{
		return (rand() % width);
	}
	else
	{
		return 0;
	}
}

void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber)
{
	ShowScore();
}

void DrawGameOver()
{
	int line, col;
	for (line = 0; line < GAMEOVER_IMG_HEIGHT; line++)
	{
		for (col = 0; col < GAMEOVER_IMG_WIDTH; col++)
		{
			Xil_Out8(TFT_FRAME_ADDR0 + 4 * (line + (SCREEN_HEIGHT - GAMEOVER_IMG_HEIGHT) / 2) * XTFT_DISPLAY_BUFFER_WIDTH + col + (SCREEN_WIDTH - GAMEOVER_IMG_WIDTH) / 2
					, gImage_gameover[line * GAMEOVER_IMG_WIDTH + col]);
		}
	}
}

BLOCK *CreateNewBlock(int line)
{
	int location;
	location = RandBlock(SCREEN_WIDTH - PADDING_LEFT - PADDING_RIGHT - BLOCK_WIDTH * 2 - 1);
	if(location != 0)
	{
		BLOCK *p;
		p = (BLOCK *)malloc(sizeof(BLOCK));
		p -> x = location + PADDING_LEFT + BLOCK_WIDTH;
		p -> y = line;
		p -> next = NULL;
		return p;
	}
	else return NULL;
}

void CalculatePeopleSpeed(PEOPLE *p)
{
	//xil_printf("%d  %d\n\r", p -> x, p -> y);
	//计算下一时刻竖直位置
	BLOCK *b;
	b = first;
	_Bool flag = TRUE;
	while(b != NULL)
	{
		//如果碰到砖块就停在砖块上
		if(b -> y >= p -> y && b -> y <= p -> y + p -> speed + PEOPLE_HEIGHT + BLOCK_HEIGHT + 1
				&& b -> x >= p -> x - PEOPLE_WIDTH - BLOCK_WIDTH - 1
				&& b -> x <= p -> x + PEOPLE_WIDTH + BLOCK_WIDTH + 1)
		{
			p -> y = b -> y - PEOPLE_HEIGHT - BLOCK_HEIGHT - 1;
			p -> speed = 0;
			flag = FALSE;
			break;
		}
		b = b -> next;
	}
	if(flag == TRUE)
	{
		p -> speed = p -> speed + GRAVITY;//自由落体加速度
		if(p -> speed >= MAX_SPEED)p -> speed = MAX_SPEED;
	}
	p -> y = p -> y + p -> speed - GAME_SPEED;//角色下落

	//xil_printf("%d  %d  %d\n\r", p -> x, p -> y, p -> speed);

	//读取水平加速度计，计算下一时刻水平位置
	accY = ReadAcc('y');
	p -> x = p -> x - accY / ACC_SENSITY;
	//防止角色撞上砖块

	//防止角色跑出屏幕
	if(p -> x <= PEOPLE_WIDTH + PADDING_LEFT) p -> x = PEOPLE_WIDTH + PADDING_LEFT;
	if(p -> x >= SCREEN_WIDTH - PEOPLE_WIDTH - PADDING_RIGHT - 1) p -> x = SCREEN_WIDTH - PEOPLE_WIDTH - PADDING_RIGHT - 2;

	//判断角色是否碰到顶部或底部
	if(p -> y <= PEOPLE_HEIGHT + PADDING_TOP)
	{
		isAlive = FALSE;
		p -> y = PEOPLE_HEIGHT + PADDING_TOP;
	}
	if(p -> y >= SCREEN_HEIGHT - PEOPLE_HEIGHT - PADDING_BOTTOM - 1)
	{
		isAlive = FALSE;
		p -> y = SCREEN_HEIGHT - PEOPLE_HEIGHT - PADDING_BOTTOM - 2;
	}
}

void RemoveOldPeople(PEOPLE *p)
{
	XTft_FillScreen(&TftInstance, p -> x - PEOPLE_WIDTH, p -> y - PEOPLE_HEIGHT, p -> x + PEOPLE_WIDTH, p -> y + PEOPLE_HEIGHT, BACKGROUND_COLOR);
}

void DrawNewPeople(PEOPLE *p)
{
	XTft_FillScreen(&TftInstance, p -> x - PEOPLE_WIDTH, p -> y - PEOPLE_HEIGHT, p -> x + PEOPLE_WIDTH, p -> y + PEOPLE_HEIGHT, PEOPLE_COLOR);
}

void RemoveOldBlock(BLOCK *b)
{
	XTft_FillScreen(&TftInstance, b -> x - BLOCK_WIDTH, b -> y - BLOCK_HEIGHT, b -> x + BLOCK_WIDTH, b -> y + BLOCK_HEIGHT, BACKGROUND_COLOR);
}

void DrawNewBlock(BLOCK *b)
{
	XTft_FillScreen(&TftInstance, b -> x - BLOCK_WIDTH, b-> y - BLOCK_HEIGHT, b -> x + BLOCK_WIDTH, b -> y + BLOCK_HEIGHT, BLOCK_COLOR);
}

void Gaming()
{
	//xil_printf("X:%d\n\r",me.x);
	BLOCK *p;
	p = first;
	//移除超出屏幕的砖块
	while(first -> y <= PADDING_TOP + BLOCK_HEIGHT + GAME_SPEED)
	{
		BLOCK *old = first;
		RemoveOldBlock(first);
		first = first -> next;
		free(old);
	}
	p = first;
	RemoveOldPeople(me);
	//计算角色下一时刻位置和速度
	CalculatePeopleSpeed(me);
	DrawNewPeople(me);
	while(1)
	{
		RemoveOldBlock(p);
		p -> y = p -> y - GAME_SPEED;//向上移动砖块
		DrawNewBlock(p);
		if(p -> next != NULL) p = p -> next;
		else break;
	}
	BLOCK *new = CreateNewBlock(SCREEN_HEIGHT - PADDING_BOTTOM - BLOCK_HEIGHT - 2);
	if(new != NULL)
	{
		p -> next = new;
		DrawNewBlock(p);
	}
	switch(score / 1000)
	{
		case 2:{
			GAME_SPEED = GAME_SPEED_DEFAULT * 1.5;
			MAX_SPEED = MAX_SPEED_DEFAULT * 1.5;
			break;
		}
		case 5:{
			GAME_SPEED = GAME_SPEED_DEFAULT * 1.5;
			MAX_SPEED = MAX_SPEED_DEFAULT * 2;
			BLOCK_DENSITY = BLOCK_DENSITY_DEFAULT + 5;
		}
	}
	score += 2;
}

void ClearScreen()
{

}

