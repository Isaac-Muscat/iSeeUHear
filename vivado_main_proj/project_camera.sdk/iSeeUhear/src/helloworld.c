#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "xil_types.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "platform.h"
#include "xstatus.h"
#include "sleep.h"
#include "xiic.h"
#include "xaxivdma.h"
#include "xaxicdma.h"

#define DISPLAY_NUM_FRAMES 3

//#define CAPTURE_WIDTH       640
//#define CAPTURE_HEIGHT      480 //full VGA
#define CAPTURE_WIDTH       160
#define CAPTURE_HEIGHT      120
#define BYTES_PER_PIXEL     2	//packing 2 pixel per 32 bit data beat
#define CAPTURE_STRIDE      (CAPTURE_WIDTH * BYTES_PER_PIXEL)
#define CAPTURE_FRAME_SIZE  (CAPTURE_STRIDE * CAPTURE_HEIGHT)

#define CAMERA_VDMA_ID_0 XPAR_AXIVDMA_0_DEVICE_ID	//first vdma for the first camera output
#define CAMERA_VDMA_ID_1 XPAR_AXIVDMA_1_DEVICE_ID	//second vdma for the second camera output

#define CDMA_ID XPAR_AXICDMA_0_DEVICE_ID	//central dma address definition
#define DDR_BASEADDR XPAR_MIG_7SERIES_0_BASEADDR	//ddr address definition

#define CDMA_BRAM_MEMORY_0 0xC0000000 // BRAM Port B mapped through 1st BRAM Controller accessed by CDMA
#define CDMA_BRAM_MEMORY_1 0xC2000000 // BRAM Port B mapped through 2nd BRAM Controller accessed by CDMA
#define CDMA_BRAM_MEMORY_2 0xC4000000 // BRAM Port B mapped through 1st BRAM Controller accessed by CDMA
#define CDMA_BRAM_MEMORY_3 0xC6000000

#define FRAMEBUF_BASEADDR_0 (DDR_BASEADDR + 0x01000000U) //frame storage for the first camera
#define FRAMEBUF_BASEADDR_1 (DDR_BASEADDR + 0x02000000U) //frame storage for the second camera


static XAxiVdma CameraVdma_0;
static XAxiVdma CameraVdma_1;
static u8 *pFrames_0[DISPLAY_NUM_FRAMES];
static u8 *pFrames_1[DISPLAY_NUM_FRAMES];
static int camera_vdma_initialized = 0;

static XAxiCdma Cdma;
u32 * cdma_memory_source, * cdma_memory_destination;

// ########################### IIC CONFIG ######################################################
#define OV7670_I2C_ADDR 0x42>>1
XIic IicInstance_0;
XIic IicInstance_1;
typedef struct {
    u8 reg;
    u8 val;
} ov7670_reg_t;
ov7670_reg_t ov7670_init_regs[] = {
		{0x12, 0x80},	//reset camera
//		{0x12, 0x04},	//com15 rgb output + vga
		{0x40, 0xD0},	//rgb format
		{0x3A, 0x04},
		{0x3D, 0xC8},
		{0x1E, 0x31},	//image orientation, flipped horizontally and vertically
		{0x6B, 0x00},	//PLL bypass, internal regulator enabled (running on xclk)

		{0x0C, 0x04},   // COM3
		{0x12, 0x04},   // COM7 (RGB/VGA base)
		{0x3E, 0x1A},   // COM14
		{0x17, 0x16},   // HSTART
		{0x18, 0x04},   // HSTOP
		{0x32, 0xA4},   // HREF (includes offset bits!)
		{0x19, 0x02},   // VSTRT
		{0x1A, 0x7A},   // VSTOP
		{0x03, 0xA4},   // VREF  (thread uses 0xA4)
		{0x72, 0x22},   // SCALING_DCWCTR
		{0x73, 0xF2},   // SCALING_PCLK_DIV
		{0x70, 0x3A},   // SCALING_XSC
		{0x71, 0x35},   // SCALING_YSC

//		{0x32, 0xB6},	//640x480 setting //HREF
//		{0x17, 0x13},	//HSTRT //640x480 setting
//		{0x18, 0x01},	//HSTOP //640x480 setting
//		{0x19, 0x02},	//VSTRT //640x480 setting
//		{0x1A, 0x7A},	//VSTOP //640x480 setting
//		{0x03, 0x0A},	//VREF     //together 640x480 resolution
//		{0x0C, 0x00},	//640x480 setting
//		{0x3E, 0x00},	//640x480 setting
//		{0x70, 0x00},	//640x480 setting
//		{0x71, 0x00},	//640x480 setting
//		{0x72, 0x11},	//640x480 setting
//		{0x73, 0x00},	//640x480 setting


		{0xA2, 0x02},
		{0x11, 0x80},	//prescaler bits 0, internal clk = input clk, xclk no divide

		//colour weights
		{0x7A, 0x20},
		{0x7B, 0x1C},
		{0x7C, 0x28},
		{0x7D, 0x3C},
		{0x7E, 0x55},
		{0x7F, 0x68},
		{0x80, 0x76},
		{0x81, 0x80},
		{0x82, 0x88},
		{0x83, 0x8F},
		{0x84, 0x96},
		{0x85, 0xA3},
		{0x86, 0xAF},
		{0x87, 0xC4},
		{0x88, 0xD7},
		{0x89, 0xE8},
		{0x13, 0xE0},
		{0x00, 0x00},
		{0x10, 0x00},
		{0x0D, 0x00},
		{0x14, 0x28},
		{0xA5, 0x05},
		{0xAB, 0x07},
		{0x24, 0x75},
		{0x25, 0x63},
		{0x26, 0xA5},
		{0x9F, 0x78},
		{0xA0, 0x68},
		{0xA1, 0x03},
		{0xA6, 0xDF},
		{0xA7, 0xDF},
		{0xA8, 0xF0},
		{0xA9, 0x90},
		{0xAA, 0x94},
		{0x13, 0xEF},
		{0x0E, 0x61},
		{0x0F, 0x4B},
		{0x16, 0x02},
		{0x21, 0x02},
		{0x22, 0x91},
		{0x29, 0x07},
		{0x33, 0x0B},
		{0x35, 0x0B},
		{0x37, 0x1D},
		{0x38, 0x71},
		{0x39, 0x2A},
		{0x3C, 0x78},
		{0x4D, 0x40},
		{0x4E, 0x20},
		{0x69, 0x0C},
		{0x74, 0x19},
		{0x8D, 0x4F},
		{0x8E, 0x00},
		{0x8F, 0x00},
		{0x90, 0x00},
		{0x91, 0x00},
		{0x92, 0x00},
		{0x96, 0x00},
		{0x9A, 0x80},
		{0xB0, 0x84},
		{0xB1, 0x0C},
		{0xB2, 0x0E},
		{0xB3, 0x82},
		{0xB8, 0x0A},
		{0x43, 0x14},
		{0x44, 0xF0},
		{0x45, 0x34},
		{0x46, 0x58},
		{0x47, 0x28},
		{0x48, 0x3A},
		{0x59, 0x88},
		{0x5A, 0x88},
		{0x5B, 0x44},
		{0x5C, 0x67},
		{0x5D, 0x49},
		{0x5E, 0x0E},
		{0x64, 0x04},
		{0x65, 0x20},
		{0x66, 0x05},
		{0x94, 0x04},
		{0x95, 0x08},
		{0x6C, 0x0A},
		{0x6D, 0x55},
		{0x6E, 0x11},
		{0x6F, 0x9F},
		{0x6A, 0x40},
		{0x01, 0x40},
		{0x02, 0x40},
		{0x13, 0xE7},
//		{0x15, 0x00}, //640x480 setting
		{0x4F, 0x80},
		{0x50, 0x80},
		{0x51, 0x00},
		{0x52, 0x22},
		{0x53, 0x5E},
		{0x54, 0x80},
		{0x58, 0x9E},
		{0x41, 0x08},
		{0x3F, 0x00},
		{0x75, 0x05},
		{0x76, 0xE1},
		{0x4C, 0x00},
		{0x77, 0x01},
		{0x4B, 0x09},
		{0xC9, 0x00},
		{0x41, 0x38},
		{0x56, 0x40},
		{0x34, 0x11},
		{0x3B, 0x02},
		{0xA4, 0x89},
		{0x96, 0x00},
		{0x97, 0x30},
		{0x98, 0x20},
		{0x99, 0x30},
		{0x9A, 0x84},
		{0x9B, 0x29},
		{0x9C, 0x03},
		{0x9D, 0x4C},
		{0x9E, 0x3F},
		{0x78, 0x04},
		{0x79, 0x01},
		{0xC8, 0xF0},
		{0x79, 0x0F},
		{0xC8, 0x00},
		{0x79, 0x10},
		{0xC8, 0x7E},
		{0x79, 0x0A},
		{0xC8, 0x80},
		{0x79, 0x0B},
		{0xC8, 0x01},
		{0x79, 0x0C},
		{0xC8, 0x0F},
		{0x79, 0x0D},
		{0xC8, 0x20},
		{0x79, 0x09},
		{0xC8, 0x80},
		{0x79, 0x02},
		{0xC8, 0xC0},
		{0x79, 0x03},
		{0xC8, 0x40},
		{0x79, 0x05},
		{0xC8, 0x30},
		{0x79, 0x26},
		{0x09, 0x03},
		{0x3B, 0x42},
		{0x8C, 0x00},	//rgb444 disabled , 0x02 enable rgb444

	    {0xFF, 0xFF}  //end marker

};

int ov7670_write_reg(u8 reg, u8 val, XIic IicInstance) {
    u8 WriteBuffer[2];
    int Status;

    WriteBuffer[0] = reg;
    WriteBuffer[1] = val;

    while (XIic_IsIicBusy((XIic*)IicInstance.BaseAddress)){
    	usleep(1000);
    }

    //returns # bytes transmitted
    Status = XIic_Send(IicInstance.BaseAddress, OV7670_I2C_ADDR, WriteBuffer, 2, XIIC_STOP);
    if (Status != 2) {
        xil_printf("I2C Write failed for reg 0x%02x\n", reg);
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

int camera_config() {

	XIic_Config *i2c_0_Config;
	XIic_Config *i2c_1_Config;
	int Status_0, Status_1;

	//device lookup
	i2c_0_Config = XIic_LookupConfig(XPAR_AXI_IIC_0_DEVICE_ID);
	if (i2c_0_Config == NULL) {
		xil_printf("Error: No config found for the FIRST AXI I2C\n");
		return XST_FAILURE;
	}
	i2c_1_Config = XIic_LookupConfig(XPAR_AXI_IIC_1_DEVICE_ID);
	if (i2c_1_Config == NULL) {
		xil_printf("Error: No config found for the SECOND AXI I2C\n");
		return XST_FAILURE;
	}

	Status_0 = XIic_CfgInitialize(&IicInstance_0, i2c_0_Config, i2c_0_Config->BaseAddress);
	Status_1 = XIic_CfgInitialize(&IicInstance_1, i2c_1_Config, i2c_1_Config->BaseAddress);

	if (Status_0 != XST_SUCCESS) {
		xil_printf("Error Status %d: FIRST I2C initialization failed\n", Status_0);
		return Status_0;
	}
	if (Status_1 != XST_SUCCESS) {
		xil_printf("Error Status %d: FIRST I2C initialization failed\n", Status_1);
		return Status_1;
	}

	//first camera register writes
	XIic_Start(&IicInstance_0);  //start the I2C interface
	int i = 0;
	while (ov7670_init_regs[i].reg != 0xFF) {
//		xil_printf("reg #%d initializing...\n", i);
		Status_0 = ov7670_write_reg(ov7670_init_regs[i].reg, ov7670_init_regs[i].val, IicInstance_0);
		if(i==0){
			usleep(100000);
		}
		if (Status_0 != XST_SUCCESS) {
			xil_printf("FIRST CAMERA Failed to write register 0x%02x\n", ov7670_init_regs[i].reg);
			return Status_0;
		}

		usleep(10000);
		i++;
	}
	xil_printf("OV7670_0 configuration complete.\n");

	//second camera register writes
	XIic_Start(&IicInstance_1);  //start the I2C interface
	i = 0;
	while (ov7670_init_regs[i].reg != 0xFF) {
//		xil_printf("reg #%d initializing...\n", i);
		Status_1 = ov7670_write_reg(ov7670_init_regs[i].reg, ov7670_init_regs[i].val, IicInstance_1);
		if(i==0){
			usleep(100000);
		}
		if (Status_1 != XST_SUCCESS) {
			xil_printf("SECOND CAMERA Failed to write register 0x%02x\n", ov7670_init_regs[i].reg);
			return Status_1;
		}

		usleep(10000);
		i++;
	}
	xil_printf("OV7670_1 configuration complete.\n");

	return XST_SUCCESS;
}

// ########################### CDMA Functions ############################################
int cdma_init(void){
	XAxiCdma_Config *Config;
	int Init_Status;

	Config = XAxiCdma_LookupConfig(CDMA_ID);
	if (!Config) {
		xil_printf("No CDMA found for device id %d\r\n", CDMA_ID);
		return XST_FAILURE;
	}

	Init_Status = XAxiCdma_CfgInitialize(&Cdma, Config, Config->BaseAddress);
	if (Init_Status != XST_SUCCESS) {
		xil_printf("CDMA CfgInitialize failed %d\r\n", Init_Status);
		return Init_Status;
	}

//	//Defining src and dest
//	cdma_memory_source = (u32 *)FRAMEBUF_BASEADDR_0;
//	cdma_memory_destination = (u32 *)CDMA_BRAM_MEMORY_0; // for CDMA to access the memory
//	xil_printf("DDR to BRAM transfer\r\n");

	// DMA in polling mode
	XAxiCdma_IntrDisable(&Cdma, XAXICDMA_XR_IRQ_ALL_MASK);
	xil_printf("Starting transfer through DMA in poll mode\r\n");

	return XST_SUCCESS;
}

static int cdma_move_frame(int i){
	//guard if i invalid
	if((i!=0) && (i!=1)){
		xil_printf("cdma move frame i=%d invalid\n", i);
		return XST_FAILURE;
	}

	int Status;
	int CDMA_Status;

	//Defining src and dest
	if(i==0){
		cdma_memory_source = (u32 *)FRAMEBUF_BASEADDR_0;
		cdma_memory_destination = (u32 *)CDMA_BRAM_MEMORY_0; // for CDMA to access the memory
	}else{
		cdma_memory_source = (u32 *)FRAMEBUF_BASEADDR_1;
		cdma_memory_destination = (u32 *)CDMA_BRAM_MEMORY_1; // for CDMA to access the memory
	}

	Status = XAxiCdma_SimpleTransfer(&Cdma, (u32) cdma_memory_source, (u32) cdma_memory_destination, CAPTURE_FRAME_SIZE, NULL, NULL);
	if (Status != XST_SUCCESS) {
		CDMA_Status = XAxiCdma_GetError(&Cdma);
		if (CDMA_Status != 0x0) {
			XAxiCdma_Reset(&Cdma);
			xil_printf("CDMA Error Code = %x\r\n",CDMA_Status);
		}
		return XST_FAILURE;
	}

	while (XAxiCdma_IsBusy(&Cdma)); // Wait

	CDMA_Status = XAxiCdma_GetError(&Cdma);
	if (CDMA_Status != 0x0) {
		XAxiCdma_Reset(&Cdma);
		xil_printf("CDMA Error Code = %x\r\n",CDMA_Status);
	}
//	else{
//		xil_printf("Moved 1 frame\n");
//	}

	return XST_SUCCESS;
}

// ########################### Camera DMA Functions ############################################
//Referenced VDMA setup from this repo: https://github.com/AG2048/ece532-project/blob/main/final_software/video_demo.c
static int camera_vdma_init_once(void)
{
	XAxiVdma_Config *Config_0;
	XAxiVdma_Config *Config_1;
	int Status_0, Status_1;

	if (camera_vdma_initialized) {
		return XST_SUCCESS;
	}

	Config_0 = XAxiVdma_LookupConfig(CAMERA_VDMA_ID_0);
	Config_1 = XAxiVdma_LookupConfig(CAMERA_VDMA_ID_1);
	if (!Config_0) {
		xil_printf("No AXI VDMA found for device id %d\r\n", CAMERA_VDMA_ID_0);
		return XST_FAILURE;
	}
	if(!Config_1){
		xil_printf("No AXI VDMA found for device id %d\r\n", CAMERA_VDMA_ID_1);
		return XST_FAILURE;
	}

	Status_0 = XAxiVdma_CfgInitialize(&CameraVdma_0, Config_0, Config_0->BaseAddress);
	Status_1 = XAxiVdma_CfgInitialize(&CameraVdma_1, Config_1, Config_1->BaseAddress);
	if (Status_0 != XST_SUCCESS) {
		xil_printf("FIRST VDMA CfgInitialize failed %d\r\n", Status_0);
		return Status_0;
	}
	if(Status_1 != XST_SUCCESS) {
		xil_printf("SECOND VDMA CfgInitialize failed %d\r\n", Status_1);
		return Status_1;
	}

	camera_vdma_initialized = 1;
	return XST_SUCCESS;
}

void camera_dma_init(void)
{
	int Status;
	XAxiVdma_DmaSetup WriteCfg_0;
	XAxiVdma_DmaSetup WriteCfg_1;

	Status = camera_vdma_init_once();
	if (Status != XST_SUCCESS) {
		return;
	}

	memset(&WriteCfg_0, 0, sizeof(WriteCfg_0));
	WriteCfg_0.VertSizeInput = CAPTURE_HEIGHT;
	WriteCfg_0.HoriSizeInput = CAPTURE_WIDTH * BYTES_PER_PIXEL;
	WriteCfg_0.Stride = CAPTURE_STRIDE;
	WriteCfg_0.FrameDelay = 0;
	WriteCfg_0.EnableCircularBuf = 1;
	WriteCfg_0.EnableSync = 0;
	WriteCfg_0.PointNum = 0;
	WriteCfg_0.EnableFrameCounter = 0;
	WriteCfg_0.FixedFrameStoreAddr = 0;
	for (int i = 0; i < DISPLAY_NUM_FRAMES; i++) {
		WriteCfg_0.FrameStoreStartAddr[i] = (UINTPTR)pFrames_0[i];
	}

	memset(&WriteCfg_1, 0, sizeof(WriteCfg_1));
	WriteCfg_1.VertSizeInput = CAPTURE_HEIGHT;
	WriteCfg_1.HoriSizeInput = CAPTURE_WIDTH * BYTES_PER_PIXEL;
	WriteCfg_1.Stride = CAPTURE_STRIDE;
	WriteCfg_1.FrameDelay = 0;
	WriteCfg_1.EnableCircularBuf = 1;
	WriteCfg_1.EnableSync = 0;
	WriteCfg_1.PointNum = 0;
	WriteCfg_1.EnableFrameCounter = 0;
	WriteCfg_1.FixedFrameStoreAddr = 0;
	for (int i = 0; i < DISPLAY_NUM_FRAMES; i++) {
		WriteCfg_1.FrameStoreStartAddr[i] = (UINTPTR)pFrames_1[i];
	}

	Status = XAxiVdma_DmaConfig(&CameraVdma_0, XAXIVDMA_WRITE, &WriteCfg_0);
	if (Status != XST_SUCCESS) {
		xil_printf("FIRST VDMA S2MM config failed %d\r\n", Status);
		return;
	}
	Status = XAxiVdma_DmaConfig(&CameraVdma_1, XAXIVDMA_WRITE, &WriteCfg_1);
	if (Status != XST_SUCCESS) {
		xil_printf("SECOND VDMA S2MM config failed %d\r\n", Status);
		return;
	}


	Status = XAxiVdma_DmaSetBufferAddr(&CameraVdma_0, XAXIVDMA_WRITE, WriteCfg_0.FrameStoreStartAddr);
	if (Status != XST_SUCCESS) {
		xil_printf("FIRST VDMA S2MM set buffer addr failed %d\r\n", Status);
		return;
	}
	Status = XAxiVdma_DmaSetBufferAddr(&CameraVdma_1, XAXIVDMA_WRITE, WriteCfg_1.FrameStoreStartAddr);
	if (Status != XST_SUCCESS) {
		xil_printf("SECOND VDMA S2MM set buffer addr failed %d\r\n", Status);
		return;
	}


	Status = XAxiVdma_DmaStart(&CameraVdma_0, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {
		xil_printf("FIRST VDMA S2MM start failed %d\r\n", Status);
		return;
	}
	Status = XAxiVdma_DmaStart(&CameraVdma_1, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {
		xil_printf("SECOND VDMA S2MM start failed %d\r\n", Status);
		return;
	}


	Status = XAxiVdma_StartParking(&CameraVdma_0, 0, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {
		xil_printf("FIRST VDMA S2MM park failed %d\r\n", Status);
		return;
	}
	Status = XAxiVdma_StartParking(&CameraVdma_1, 0, XAXIVDMA_WRITE);
	if (Status != XST_SUCCESS) {
		xil_printf("SECOND VDMA S2MM park failed %d\r\n", Status);
		return;
	}
}


static void init_frame_addrs(void)
{
	for (int i = 0; i < DISPLAY_NUM_FRAMES; i++) {
		pFrames_0[i] = (u8*)(FRAMEBUF_BASEADDR_0 + (i * CAPTURE_FRAME_SIZE));
		pFrames_1[i] = (u8*)(FRAMEBUF_BASEADDR_1 + (i * CAPTURE_FRAME_SIZE));
	}
}

static int move_frame_grayscale(){

	int Status;
	int CDMA_Status;

	u32* left_coloured_src = (u32 *)CDMA_BRAM_MEMORY_0;
	u32* right_coloured_src = (u32 *)CDMA_BRAM_MEMORY_1;
	u32* left_gray_dst = (u32 *)CDMA_BRAM_MEMORY_2;
	u32* right_gray_dst = (u32 *)CDMA_BRAM_MEMORY_3 + 40*7 + 2;

	uint8_t* gray = (uint8_t*)malloc(CAPTURE_FRAME_SIZE/2);

	int gray_idx = 0;
	for(int i=0; i<CAPTURE_WIDTH*CAPTURE_HEIGHT/2; i++){
		u32 rgb = Xil_In32((UINTPTR)left_coloured_src+(i*2*2)); //rgb565 2B per pixel 2 pixel per read

		u16 px_one = rgb & 0x0000FFFF;
		u16 px_two = (rgb & 0xFFFF0000)>>16;

		gray[gray_idx++] = (uint8_t)fminf(255.0f,
									0.299f*((px_one&0b1111100000000000)>>11) + 0.587f*((px_one&0b11111100000)>>5) + 0.114f*(px_one&0b11111)
									);
		gray[gray_idx++] = (uint8_t)fminf(255.0f,
									0.299f*((px_two&0b1111100000000000)>>11) + 0.587f*((px_two&0b11111100000)>>5) + 0.114f*(px_two&0b11111)
									);
	}
	u32 value;
	for(int i=0; i<CAPTURE_WIDTH*CAPTURE_HEIGHT/4; i++){
		value = (gray[(i*4)+3]<<25)|(gray[(i*4)+2]<<17)|(gray[(i*4)+1]<<9)|(gray[(i*4)]<<1);
		Xil_Out32((UINTPTR)left_gray_dst+i*4,value);
	}



	gray_idx = 0;
	for(int i=0; i<CAPTURE_WIDTH*CAPTURE_HEIGHT/2; i++){
		u32 rgb = Xil_In32((UINTPTR)right_coloured_src+(i*2*2)); //rgb565 2B per pixel 2 pixel per read

		u16 px_one = rgb & 0x0000FFFF;
		u16 px_two = (rgb & 0xFFFF0000)>>16;

		gray[gray_idx++] = (uint8_t)fminf(255.0f,
									0.299f*((px_one&0b1111100000000000)>>11) + 0.587f*((px_one&0b11111100000)>>5) + 0.114f*(px_one&0b11111)
									);
		gray[gray_idx++] = (uint8_t)fminf(255.0f,
									0.299f*((px_two&0b1111100000000000)>>11) + 0.587f*((px_two&0b11111100000)>>5) + 0.114f*(px_two&0b11111)
									);
	}
	value=0;
	for(int i=0; i<CAPTURE_WIDTH*CAPTURE_HEIGHT/4; i++){
		value = (gray[(i*4)+3]<<25)|(gray[(i*4)+2]<<17)|(gray[(i*4)+1]<<9)|(gray[(i*4)]<<1);
		Xil_Out32((UINTPTR)right_gray_dst+i*4,value);
	}

	return XST_SUCCESS;
}

// Seb's Integration Stuff ==========================================================
// I2S_TX
#define CTRL_REG 0x8 // [31:17] Reserved, [16] Latch AES Channel Status, [15:4] Reserved, [3] Selected 32-bit LR clock mode, [2] Valid when bit 1 is set (0: Left Justification, 1: Right Justification), [1] Enable Left/Right Justification, [0] Enable
#define I2S_TIMING_CTRL_REG 0x20 // [31:8] Reserved, [7:0] SCLK Out Divider Value: MCLK/SCLK = Divider_value*2
#define CHANNEL_0_1_CTRL 0x30 // [31:3] Reserved, [2:0] Channel MUX Value (0: disabled, 1: Audio received on I2S channel 0 is routed as audio channel 0/1, ...)

#define MCLK 24000000

#define GPIO_IN_BASE XPAR_AXI_GPIO_INPUTS_BASEADDR // 0x40000000
#define SW_BASE XPAR_AXI_GPIO_INPUTS_BASEADDR
#define BTN_BASE (XPAR_AXI_GPIO_INPUTS_BASEADDR + 0x8)

#define GPIO_OUT_BASE XPAR_AXI_GPIO_OUTPUTS_BASEADDR // 0x40010000
#define LED_BASE XPAR_AXI_GPIO_OUTPUTS_BASEADDR

#define I2S_TX_BASE XPAR_I2S_TRANSMITTER_0_BASEADDR // 0x44A40000
#define TX_DATA_OFFSET 0x00
#define TX_FIFO_RESET 0x08
#define TX_LEN_OFFSET 0x14

// AXI VOL REG
#define VOL_REG 0x44A80000

// AXI FREQ REG
#define FREQ_REG 0x44A50000

// AXI LEFT BIAS REG
#define LEFT_BIAS_REG 0x44A70000

// AXI RIGHT BIAS REG
#define RIGHT_BIAS_REG 0x44A60000

// MEM ADDR
#define BRAM_BASE 0xC8000000
#define WIDTH 136
#define HEIGHT 113

int set_volume_using_distance(int distance) { // distance given in cm
	int volume;
	volume = (0x8000 * 100) / distance;

	Xil_Out32(VOL_REG, volume);
	return volume;
}

int set_freq(int freq) {
//	uint64_t PINC = (1<<30) / 25000000;
//	PINC = freq*PINC;
	int PINC = freq*172;
	Xil_Out32(FREQ_REG, (int) PINC);
}

int get_freq_from_C_scale(int index) {
	int frequency = 0;

	if (index == 0) {
		frequency = 262;
	} else if (index == 1) {
		frequency = 294;
	} else if (index == 2) {
		frequency = 330;
	} else if (index == 3) {
		frequency = 349;
	} else if (index == 4) {
		frequency = 392;
	} else if (index == 5) {
		frequency = 440;
	} else if (index == 6) {
		frequency = 493;
	} else if (index == 7) {
		frequency = 523;
	} else if (index == 8) {
		frequency = 587;
	} else if (index == 9) {
		frequency = 659;
	} else if (index == 10) {
		frequency = 698;
	} else if (index == 11) {
		frequency = 784;
	} else if (index == 12) {
		frequency = 880;
	} else if (index == 13) {
		frequency = 988;
	} else if (index == 14) {
		frequency = 1047;
	} else if (index == 15) {
		frequency = 1175;
	} else if (index == 16) {
		frequency = 1319;
	} else if (index == 17) {
		frequency = 1397;
	} else if (index == 18) {
		frequency = 1568;
	} else if (index == 19) {
		frequency = 1760;
	} else if (index == 20) {
		frequency = 1976;
	} else if (index == 21) {
		frequency = 2093;
	} else if (index == 22) {
		frequency = 2349;
	} else if (index == 23) {
		frequency = 2637;
	}

	return frequency;
}

void I2S_Setup() {
	// I2S_RX setup
	print("Setting up I2S_RX...\n");

	int div_val = 0x4;
	int sample_rate = MCLK / (div_val*2*2*16);

	xil_printf("\tWriting 0x%x to %p\n", 1, I2S_TX_BASE + CTRL_REG);
	Xil_Out32(I2S_TX_BASE + CTRL_REG, 0x1);
	xil_printf("\tAddress 0x%p = 0x%x\n", (I2S_TX_BASE + CTRL_REG), Xil_In32(I2S_TX_BASE + CTRL_REG));

	xil_printf("\tWriting 0x%x to %p\n", div_val, I2S_TX_BASE + I2S_TIMING_CTRL_REG);
	Xil_Out32(I2S_TX_BASE + I2S_TIMING_CTRL_REG, div_val);
	xil_printf("\tAddress 0x%p = 0x%x\n", (I2S_TX_BASE + I2S_TIMING_CTRL_REG), Xil_In32(I2S_TX_BASE + I2S_TIMING_CTRL_REG));

	xil_printf("\tWriting 0x%x to %p\n", 1, I2S_TX_BASE + CHANNEL_0_1_CTRL);
	Xil_Out32(I2S_TX_BASE + CHANNEL_0_1_CTRL, 1);
	xil_printf("\tAddress 0x%p = 0x%x\n", (I2S_TX_BASE + CHANNEL_0_1_CTRL), Xil_In32(I2S_TX_BASE + CHANNEL_0_1_CTRL));

	set_freq(440);
	Xil_Out32(VOL_REG, 16384);
	Xil_Out32(LEFT_BIAS_REG, 16384);
	Xil_Out32(RIGHT_BIAS_REG, 16384);
}

void pre_integration() {
	int sw_vals;
	int btn_vals;
	int freq;

	// Location Variables
	int r_dist = 1;

	// GET
	sw_vals = Xil_In32(SW_BASE);
	btn_vals = Xil_In32(BTN_BASE);

	Xil_Out32(LED_BASE, sw_vals);

	if (btn_vals == 1) { // BTNU
		if ((sw_vals & 0x8000) == 0x8000) { // only sw15 on
			freq = (sw_vals & 0x7FFF); // use switches to set exact freq without sw15
		} else {
			freq = get_freq_from_C_scale(sw_vals);
		}

		set_freq(freq);
		xil_printf("freq: %d\n", freq);

		xil_printf("sw, 0x%p = 0x%x\n", SW_BASE, Xil_In32(SW_BASE));
		xil_printf("led, 0x%p = 0x%x\n", LED_BASE, Xil_In32(LED_BASE));
	} else if (btn_vals == 2) { // BTNL
		Xil_Out32(LEFT_BIAS_REG, sw_vals);
		xil_printf("left bias: %d\n", sw_vals);

	} else if (btn_vals == 4) { // BTNC
		if (sw_vals == 0) {
			r_dist = 100;
			freq = 4096;
		} else if (sw_vals == 1) {
			r_dist = 200;
			freq = 4096;
		} else if (sw_vals == 2) {
			r_dist = 300;
			freq = 4096;
		} else if (sw_vals == 3) {
			r_dist = 100;
			freq = 724;
		} else if (sw_vals == 4) {
			r_dist = 200;
			freq = 724;
		} else if (sw_vals == 5) {
			r_dist = 300;
			freq = 724;
		} else if (sw_vals == 6) {
			r_dist = 100;
			freq = 128;
		} else if (sw_vals == 7) {
			r_dist = 200;
			freq = 128;
		} else if (sw_vals == 8) {
			r_dist = 300;
			freq = 128;
		}

		set_freq(freq);
		set_volume_using_distance(r_dist);
	} else if (btn_vals == 8) { // BTNR
		Xil_Out32(RIGHT_BIAS_REG, sw_vals);
		xil_printf("right bias: %d\n", sw_vals);

	} else if (btn_vals == 16) { // BTND
		Xil_Out32(VOL_REG, sw_vals);
		xil_printf("vol: %d\n", sw_vals);
	}
}

u8 depth;
u8 z;
int x;
int y;
int print_counter = 0;

int left_bias, right_bias, freq, vol;

void one_tone() {
	depth = 0;

	for (int row = 0; row < (HEIGHT - 1); row++) {
		for (int col = 0; col < WIDTH; col++) {
			depth = Xil_In8(BRAM_BASE + row*WIDTH + col);

			if (depth > z) {
				x = col;
				y = row;
				z = depth;
			}
		}
	}

	// 0 <-- x --> 136 (WIDTH)
		//   1 <-- LEFT BIAS  --> 0
		//   0 <-- RIGHT BIAS --> 1
	left_bias = (-1*(x-WIDTH+1)*16384) / (WIDTH - 1);
	right_bias = ( ((x*16384) / (WIDTH - 1)));
	Xil_Out32(LEFT_BIAS_REG, left_bias);
	Xil_Out32(RIGHT_BIAS_REG, right_bias);

	// 0 <-- y --> 113 (HEIGHT)
		// 4096 <-- FREQ --> 128
	freq = ((((-1*(y-HEIGHT+1))*3968) / (HEIGHT - 1))) + 128;
	set_freq(freq);

	// 0 <-- z --> 255 (DEPTH)
		// 0 <-- VOL --> 16384
	vol = ((z*16384) / (254));
	Xil_Out32(VOL_REG, vol);

	//			xil_printf("pc = %d\n", print_counter);

	if (print_counter == 0) {
		xil_printf("x = %d\n", x);
		xil_printf("\tleft_bias = %d, right_bias = %d\n", left_bias, right_bias);

		xil_printf("y = %d\n", y);
		xil_printf("\tfreq = %d\n", freq);

		xil_printf("z = %d\n", z);
		xil_printf("\tvol = %d\n\n", vol);
		print_counter = 10;
	}

	print_counter -= 1;
}

void sweep() {
	depth = 0;
	int closest_x_zone = -1;
	int closest_y_zone = -1;
	int closest_zone = -1;
	int sum = 0;
	int largest_sum = 0;

	for (int x_zone = 0; x_zone < 3; x_zone++) {
		for (int y_zone = 0; y_zone < 4; y_zone++) {
			for (int row = 0; row < 25; row++) {
				for (int col = 0; col < 40; col++) {
					depth = Xil_In8(BRAM_BASE + (y_zone*25 + row)*WIDTH + (x_zone*40 + col));
					sum += depth;

				}
			}

			if (sum > 10000) {
				if (sum > largest_sum) {

					largest_sum = sum;
					closest_x_zone = x_zone;
					closest_y_zone = y_zone;
					closest_zone = y_zone*3 + x_zone;
					x = x_zone * 40 + 20;
					y = y_zone * 25 + 12;
					z = largest_sum / (40*25);
				}
			}
			sum = 0;

		}
	}

	xil_printf("closest_zone = %d\n", closest_zone);
	xil_printf("largest_sum = %d\n", largest_sum);
	if (closest_zone == -1) {
		vol = 0;
		Xil_Out32(VOL_REG, vol);
	}

	if (closest_x_zone == 0) {
		left_bias = 16384;
		right_bias = 0;
	} else if (closest_x_zone == 1) {
		left_bias = 12000;
		right_bias = 12000;
	} else if (closest_x_zone == 2) {
		left_bias = 0;
		right_bias = 16384;
	}

	if (closest_y_zone == 0) {
		freq = 494;
	} else if (closest_y_zone == 1) {
		freq = 392;
	} else if (closest_y_zone == 2) {
		freq = 330;
	} else if (closest_y_zone == 3) {
		freq = 262;
	}

	// 0 <-- x --> 136 (WIDTH)
		//   1 <-- LEFT BIAS  --> 0
		//   0 <-- RIGHT BIAS --> 1
//	left_bias = (-1*(x-WIDTH+1)*16384) / (WIDTH - 1);
//	right_bias = ( ((x*16384) / (WIDTH - 1)));
	Xil_Out32(LEFT_BIAS_REG, left_bias);
	Xil_Out32(RIGHT_BIAS_REG, right_bias);

	// 0 <-- y --> 113 (HEIGHT)
		// 4096 <-- FREQ --> 128
//	freq = ((((-1*(y-HEIGHT+1))*3968) / (HEIGHT - 1))) + 128;
	set_freq(freq);

	// 0 <-- z --> 255 (DEPTH)
		// 0 <-- VOL --> 16384
//	vol = ((z*16384) / (254));
	vol = ((largest_sum*16384) / (25*40*255));
	Xil_Out32(VOL_REG, vol);

	//			xil_printf("pc = %d\n", print_counter);

	if (print_counter == 0) {
		xil_printf("x = %d\n", x);
		xil_printf("\tleft_bias = %d, right_bias = %d\n", left_bias, right_bias);

		xil_printf("y = %d\n", y);
		xil_printf("\tfreq = %d\n", freq);

		xil_printf("z = %d\n", z);
		xil_printf("\tvol = %d\n\n", vol);
		print_counter = 1;
	}

	print_counter -= 1;
}

int main(void)
{
	cleanup_platform();
	init_platform();

	xil_printf("System Init \n");
	init_frame_addrs();

	//Configure camera, start VDMA capture.
	if (camera_config() != XST_SUCCESS) {
		xil_printf("Camera config failed.\r\n");
		return 1;
	}

	camera_dma_init();
	xil_printf("Camera 1 capture started. Frame0 @ 0x%08lx\r\n", (unsigned long)pFrames_0[0]);
	xil_printf("Camera 2 capture started. Frame0 @ 0x%08lx\r\n", (unsigned long)pFrames_1[0]);


	if(cdma_init() != XST_SUCCESS){
		xil_printf("CDMA config failed.\r\n");
		return 1;
	}

	//debug sample first 4 pixels
	int debug_count = 1;

	// Seb Stuff
	I2S_Setup();

	int sw_vals;
	int btn_vals;
	int mode = 0;

	while (1) {
		cdma_move_frame(0);
		cdma_move_frame(1);

		move_frame_grayscale();
		unsigned volatile int* depth_engine_mm = (unsigned int*)XPAR_AXI_IF_DEPTH_ALGO_0_S00_AXI_BASEADDR;
		*(depth_engine_mm) = 1;

		if (*(depth_engine_mm+1) == 0) {
			*(depth_engine_mm) = 0;
		}
		if(debug_count % 12 == 0){
			debug_count = 1; //debug

		}
		Xil_DCacheInvalidateRange((INTPTR)pFrames_0[0], 64);
		Xil_DCacheInvalidateRange((INTPTR)pFrames_1[0], 64);
		usleep(100000);
		debug_count++;

		// Seb Stuff
		// GET
//		one_tone();
//		sweep();
		sw_vals = Xil_In32(SW_BASE);
		btn_vals = Xil_In32(BTN_BASE);
		Xil_Out32(LED_BASE, sw_vals);

		if ((btn_vals == 1) && (sw_vals == 0)) {
			mode = 0;
		} else if ((btn_vals == 1) && (sw_vals == 0x8000)) {
			mode = 1;
		}

		if (mode == 0) {
			pre_integration();
		} else {
			sweep();
		}
	}

	return 0;
}

//mrd -bin -file "C:/Users/sserg/Documents/School/4th_year/ECE532/Project/dump.bin" 0xc8000000 15368
//mrd -bin -file "C:/James/ECE532/python_scripts/small.bin" 0x81000000 0x9600
