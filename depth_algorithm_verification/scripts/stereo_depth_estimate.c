#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "data_carray_160x120_nearest_grayscale/podium1/im0.h"
#include "data_carray_160x120_nearest_grayscale/podium1/im1.h"

#define BLOCK_SIZE 8
#define MAX_DISPARITY 16 
//#define MIN_THRESHOLD 0x700
#define MEDIAN_SIZE 5

#pragma pack(push, 1)
typedef struct {
  uint16_t bfType;
  uint32_t bfSize;
  uint16_t bfReserved1;
  uint16_t bfReserved2;
  uint32_t bfOffBits;
} BMPHeader;

typedef struct {
  uint32_t biSize;
  int32_t  biWidth;
  int32_t  biHeight;
  uint16_t biPlanes;
  uint16_t biBitCount;
  uint32_t biCompression;
  uint32_t biSizeImage;
  int32_t  biXPelsPerMeter;
  int32_t  biYPelsPerMeter;
  uint32_t biClrUsed;
  uint32_t biClrImportant;
} BMPInfoHeader;
#pragma pack(pop)

// ========================================================
// Load 8-bit or 24-bit BMP
// ========================================================

uint8_t* LoadBMP(const char* filename,
                 int* width,
                 int* height,
                 int* channels) {

  FILE* f = fopen(filename, "rb");
  if (!f) {
    printf("Failed to open %s\n", filename);
    return NULL;
  }

  BMPHeader header;
  BMPInfoHeader info;

  fread(&header, sizeof(header), 1, f);
  fread(&info, sizeof(info), 1, f);

  if (header.bfType != 0x4D42) {
    printf("Not a BMP file.\n");
    fclose(f);
    return NULL;
  }

  if (info.biBitCount != 8 && info.biBitCount != 24) {
    printf("Only 8-bit or 24-bit BMP supported.\n");
    fclose(f);
    return NULL;
  }

  *width  = info.biWidth;
  *height = info.biHeight;
  *channels = (info.biBitCount == 24) ? 3 : 1;

  int row_stride = (*width) * (*channels);
  int row_padded = (row_stride + 3) & (~3);

  uint8_t* data = (uint8_t*)malloc((*width) * (*height) * (*channels));
  uint8_t* row  = (uint8_t*)malloc(row_padded);

  // Move to pixel data
  fseek(f, header.bfOffBits, SEEK_SET);

  for (int y = (*height) - 1; y >= 0; y--) {
    fread(row, 1, row_padded, f);
    memcpy(&data[y * row_stride], row, row_stride);
  }

  free(row);
  fclose(f);
  return data;
}

// ========================================================
// Load 24-bit BMP into RGB buffer
// ========================================================

//uint8_t* LoadBMP(const char* filename, int* width, int* height) {
//
//  FILE* f = fopen(filename, "rb");
//  if (!f) {
//    printf("Failed to open %s\n", filename);
//    return NULL;
//  }
//
//  BMPHeader header;
//  BMPInfoHeader info;
//
//  fread(&header, sizeof(header), 1, f);
//  fread(&info, sizeof(info), 1, f);
//
//  if (header.bfType != 0x4D42 || info.biBitCount != 24) {
//    printf("Only 24-bit BMP supported.\n");
//    fclose(f);
//    return NULL;
//  }
//
//  *width = info.biWidth;
//  *height = info.biHeight;
//
//  int row_padded = (*width * 3 + 3) & (~3);
//
//  uint8_t* data = (uint8_t*)malloc((*width) * (*height) * 3);
//  uint8_t* row  = (uint8_t*)malloc(row_padded);
//
//  fseek(f, header.bfOffBits, SEEK_SET);
//
//  for (int y = (*height) - 1; y >= 0; y--) {
//    fread(row, 1, row_padded, f);
//    memcpy(&data[y * (*width) * 3], row, (*width) * 3);
//  }
//
//  free(row);
//  fclose(f);
//  return data;
//}


// ========================================================
// Save grayscale BMP
// ========================================================

void SaveBMPGrayscale(const char* filename,
                      uint8_t* gray,
                      int width,
                      int height) {

  FILE* f = fopen(filename, "wb");

  int row_padded = (width + 3) & (~3);
  int image_size = row_padded * height;

  BMPHeader header = {0};
  BMPInfoHeader info = {0};

  header.bfType = 0x4D42;
  header.bfOffBits = sizeof(BMPHeader) + sizeof(BMPInfoHeader) + 256 * 4;
  header.bfSize = header.bfOffBits + image_size;

  info.biSize = sizeof(BMPInfoHeader);
  info.biWidth = width;
  info.biHeight = height;
  info.biPlanes = 1;
  info.biBitCount = 8;
  info.biSizeImage = image_size;
  info.biClrUsed = 256;

  fwrite(&header, sizeof(header), 1, f);
  fwrite(&info, sizeof(info), 1, f);

  // Write grayscale palette
  for (int i = 0; i < 256; i++) {
    uint8_t entry[4] = { (uint8_t)i, (uint8_t)i, (uint8_t)i, 0 };
    fwrite(entry, 1, 4, f);
  }

  uint8_t* row = (uint8_t*)calloc(row_padded, 1);

  for (int y = height - 1; y >= 0; y--) {
    memcpy(row, &gray[y * width], width);
    fwrite(row, 1, row_padded, f);
  }

  free(row);
  fclose(f);
}

// ========================================================
// Save RGB BMP
// ========================================================

void SaveBMPRgb(const char* filename,
                const uint8_t* rgb,
                int width,
                int height) {

  FILE* f = fopen(filename, "wb");
  if (!f) {
    printf("Failed to open %s for writing\n", filename);
    return;
  }

  int row_stride = width * 3;
  int row_padded = (row_stride + 3) & (~3);
  int image_size = row_padded * height;

  BMPHeader header = {0};
  BMPInfoHeader info = {0};

  header.bfType = 0x4D42; // "BM"
  header.bfOffBits = sizeof(BMPHeader) + sizeof(BMPInfoHeader);
  header.bfSize = header.bfOffBits + image_size;

  info.biSize = sizeof(BMPInfoHeader);
  info.biWidth = width;
  info.biHeight = height;     // positive = bottom-up
  info.biPlanes = 1;
  info.biBitCount = 24;
  info.biCompression = 0;     // BI_RGB (no compression)
  info.biSizeImage = image_size;

  fwrite(&header, sizeof(header), 1, f);
  fwrite(&info, sizeof(info), 1, f);

  uint8_t* row = (uint8_t*)calloc(row_padded, 1);

  for (int y = height - 1; y >= 0; y--) {

    const uint8_t* src = &rgb[y * width * 3];

    for (int x = 0; x < width; x++) {
      // BMP expects BGR order
      row[x * 3 + 0] = src[x * 3 + 0]; // B
      row[x * 3 + 1] = src[x * 3 + 1]; // G
      row[x * 3 + 2] = src[x * 3 + 2]; // R
    }

    fwrite(row, 1, row_padded, f);
  }

  free(row);
  fclose(f);
}


// ==============================
// Convert color to grayscale
// ==============================

uint8_t* to_grayscale(uint8_t* data, int width, int height, int channels) {
    if (channels == 1) {
        return data;
    }
    uint8_t* gray = (uint8_t*)malloc(width*height);
    for (int i = 0; i < width*height; i++) {
        if (channels == 1)
            gray[i] = data[i];
        else
            gray[i] = (uint8_t)fminf(255.0f,
                0.299f*data[i*3+2] + 0.587f*data[i*3+1] + 0.114f*data[i*3+0]
            ); // BMP is BGR
    }
    return gray;
}

// ==============================
// SAD Block Matching
// ==============================

void compute_disparity(const uint8_t* left, const uint8_t* right, uint8_t* disparity, int width, int height) {
    int half = BLOCK_SIZE / 2;

    for (int y = half; y < height - half; y++) {
        //printf("y=%d\n", y);
        for (int x = half + MAX_DISPARITY; x < width - half; x++) {
            int best_d = 0;
            int best_cost = 1e9;

            for (int d = 0; d < MAX_DISPARITY; d++) {
                int xr = x - d;
                if (xr - half < 0) continue;

                int sad = 0;
                for (int v = -half; v <= half; v++)
                    for (int u = -half; u <= half; u++)
                        sad += abs(left[(y+v+7)*width + (x+u)] - right[(y+v)*width + (xr+u)]);

                //printf("\tsad: %x\n", sad);
                if (sad < best_cost) {
                    best_cost = sad;
                    best_d = d;
                }
            }

            //printf("\t%x\n", best_d);
            //printf("best sad: %x\n", best_d);
            printf("best sad: %x\n", best_cost);
            disparity[y*width + x] = (uint8_t)((best_d*255)/MAX_DISPARITY);
            //if (best_cost < MIN_THRESHOLD) {
            //    //disparity[y*width + x] = 0;
            //    disparity[y*width + x] = (uint8_t)((best_d*255)/MAX_DISPARITY);
            //} else {
            //    disparity[y*width + x] = (uint8_t)((best_d*255)/MAX_DISPARITY);
            //}
            //disparity[y*width + x] = (uint8_t)((best_d*255)/MAX_DISPARITY);
            //disparity[y*width + x] = (uint8_t)((best_d)/1);
        }
    }
}

// ==============================
// Median Filter
// ==============================

int compare(const void* a, const void* b) {
    return (*(uint8_t*)a - *(uint8_t*)b);
}

void median_filter(uint8_t* input, uint8_t* output, int width, int height) {
    int half = MEDIAN_SIZE/2;
    uint8_t window[MEDIAN_SIZE*MEDIAN_SIZE];

    for (int y = half; y < height-half; y++) {
        for (int x = half; x < width-half; x++) {
            int k=0;
            for (int v=-half; v<=half; v++)
                for (int u=-half; u<=half; u++)
                    window[k++] = input[(y+v)*width + (x+u)];
            qsort(window, MEDIAN_SIZE*MEDIAN_SIZE, sizeof(uint8_t), compare);
            output[y*width + x] = window[(MEDIAN_SIZE*MEDIAN_SIZE)/2];
        }
    }
}

// ==============================
// Main
// ==============================

int main() {
    int width, height, channels;
    //const char* LEFT_PATH  = "data_bmp_80x60_nearest_grayscale/artroom1/im0.bmp";
    //const char* RIGHT_PATH = "data_bmp_80x60_nearest_grayscale/artroom1/im1.bmp";

    const char* LEFT_PATH  = "left.bmp";
    const char* RIGHT_PATH = "right.bmp";

    uint8_t* left  = LoadBMP(LEFT_PATH, &width, &height, &channels);
    uint8_t* right = LoadBMP(RIGHT_PATH, &width, &height, &channels);
    
    //width = IM0_WIDTH;
    //height = IM0_HEIGHT;

    if (!left || !right) {
        printf("Failed to load BMP images\n");
        return -1;
    }

    printf("%d, %d\n", width, height);
    //uint8_t* left  = to_grayscale(left_bmp, width, height, channels);
    //uint8_t* right = to_grayscale(right_bmp, width, height, channels);

    uint8_t* disparity = (uint8_t*)calloc(width*height,1);
    uint8_t* filtered  = (uint8_t*)calloc(width*height,1);

    printf("Computing disparity...\n");
    compute_disparity(right, left, disparity, width, height);
    //compute_disparity(im0, im1, disparity, width, height);


    //for (int i = 0; i < width*height; i++) {
    //    printf("Disparity: %x\n",disparity[i]);
    //}

    printf("Applying median filter...\n");
    median_filter(disparity, filtered, width, height);

    // Save results as grayscale BMP
    SaveBMPGrayscale("disparity_raw.bmp", disparity, width, height);
    SaveBMPGrayscale("disparity_filtered.bmp", filtered, width, height);

    printf("Done.\n");
    return 0;
}

