
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include "xil_printf.h"
#include "xparameters.h"
//
//
//#include "data_carray_160x120_nearest_grayscale/artroom1/im0.h"
//#include "data_carray_160x120_nearest_grayscale/artroom1/im1.h"
//
//#define BLOCK_SIZE 7
//#define MAX_DISPARITY 20
//#define MEDIAN_SIZE 5
//
//
//// ==============================
//// Convert color to grayscale
//// ==============================
//
//uint8_t* to_grayscale(uint8_t* data, uint8_t* gray, int width, int height, int channels) {
//    for (int i = 0; i < width*height; i++) {
//        if (channels == 1)
//            gray[i] = data[i];
//        else
//            gray[i] = (uint8_t)fminf(255.0f,
//                0.299f*data[i*3+2] + 0.587f*data[i*3+1] + 0.114f*data[i*3+0]
//            ); // BMP is BGR
//    }
//    return gray;
//}
//
//// ==============================
//// SAD Block Matching
//// ==============================
//
//void compute_disparity(const uint8_t* left, const uint8_t* right, uint8_t* disparity, int width, int height) {
//    int half = BLOCK_SIZE / 2;
//
//    for (int y = half; y < height - half; y++) {
//        for (int x = half + MAX_DISPARITY; x < width - half; x++) {
//            int best_d = 0;
//            int best_cost = 1e9;
//
//            for (int d = 0; d < MAX_DISPARITY; d++) {
//                int xr = x - d;
//                if (xr - half < 0) continue;
//
//                int sad = 0;
//                for (int v = -half; v <= half; v++)
//                    for (int u = -half; u <= half; u++)
//                        sad += abs(left[(y+v)*width + (x+u)] - right[(y+v)*width + (xr+u)]);
//
//                if (sad < best_cost) {
//                    best_cost = sad;
//                    best_d = d;
//                }
//            }
//
//            disparity[y*width + x] = (uint8_t)((best_d*255)/MAX_DISPARITY);
//        }
//    }
//}
//
//// ==============================
//// Median Filter
//// ==============================
//
//int compare(const void* a, const void* b) {
//    return (*(uint8_t*)a - *(uint8_t*)b);
//}
//
//void median_filter(uint8_t* input, uint8_t* output, int width, int height) {
//    int half = MEDIAN_SIZE/2;
//    uint8_t window[MEDIAN_SIZE*MEDIAN_SIZE];
//
//    for (int y = half; y < height-half; y++) {
//        for (int x = half; x < width-half; x++) {
//            int k=0;
//            for (int v=-half; v<=half; v++)
//                for (int u=-half; u<=half; u++)
//                    window[k++] = input[(y+v)*width + (x+u)];
//            qsort(window, MEDIAN_SIZE*MEDIAN_SIZE, sizeof(uint8_t), compare);
//            output[y*width + x] = window[(MEDIAN_SIZE*MEDIAN_SIZE)/2];
//        }
//    }
//}
//
//// ==============================
//// Main
//// ==============================
//
//#define WIDTH (160)
//#define HEIGHT (120)
//static uint8_t disparity[WIDTH*HEIGHT];
//static uint8_t filtered[WIDTH*HEIGHT];

int main() {

	xil_printf("Started\n");

//    xil_printf("Grayscale conversion\n");
//    to_grayscale(left_bmp, left, width, height, channels);
//    to_grayscale(right_bmp, right, width, height, channels);

//    xil_printf("Computing disparity...\n");
//    compute_disparity(im0, im1, disparity, WIDTH, HEIGHT);
//
//    xil_printf("Applying median filter...\n");
//    median_filter(disparity, filtered, WIDTH, HEIGHT);
//
//    for (int i = 0; i < WIDTH * HEIGHT; i++) {
//    	xil_printf("%d\n", filtered[i]);
//    }

    xil_printf("Done.\n");
    return 0;
}

