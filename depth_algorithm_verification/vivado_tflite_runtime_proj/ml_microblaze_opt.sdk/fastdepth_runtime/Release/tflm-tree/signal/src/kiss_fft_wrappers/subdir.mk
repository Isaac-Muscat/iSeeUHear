################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_float.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int16.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int32.cc 

CC_DEPS += \
./tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_float.d \
./tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int16.d \
./tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int32.d 

OBJS += \
./tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_float.o \
./tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int16.o \
./tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int32.o 


# Each subdirectory must supply rules for building sources it contributes
tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_float.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_float.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O2 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int16.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int16.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O2 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int32.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/src/kiss_fft_wrappers/kiss_fft_int32.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O2 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


