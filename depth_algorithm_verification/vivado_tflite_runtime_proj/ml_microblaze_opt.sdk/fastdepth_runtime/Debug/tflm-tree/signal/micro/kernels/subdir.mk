################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/delay.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/energy.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/fft_auto_scale_common.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/fft_auto_scale_kernel.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_log.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_spectral_subtraction.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_square_root.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_square_root_common.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/framer.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/irfft.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/overlap_add.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/pcan.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/rfft.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/stacker.cc \
C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/window.cc 

CC_DEPS += \
./tflm-tree/signal/micro/kernels/delay.d \
./tflm-tree/signal/micro/kernels/energy.d \
./tflm-tree/signal/micro/kernels/fft_auto_scale_common.d \
./tflm-tree/signal/micro/kernels/fft_auto_scale_kernel.d \
./tflm-tree/signal/micro/kernels/filter_bank.d \
./tflm-tree/signal/micro/kernels/filter_bank_log.d \
./tflm-tree/signal/micro/kernels/filter_bank_spectral_subtraction.d \
./tflm-tree/signal/micro/kernels/filter_bank_square_root.d \
./tflm-tree/signal/micro/kernels/filter_bank_square_root_common.d \
./tflm-tree/signal/micro/kernels/framer.d \
./tflm-tree/signal/micro/kernels/irfft.d \
./tflm-tree/signal/micro/kernels/overlap_add.d \
./tflm-tree/signal/micro/kernels/pcan.d \
./tflm-tree/signal/micro/kernels/rfft.d \
./tflm-tree/signal/micro/kernels/stacker.d \
./tflm-tree/signal/micro/kernels/window.d 

OBJS += \
./tflm-tree/signal/micro/kernels/delay.o \
./tflm-tree/signal/micro/kernels/energy.o \
./tflm-tree/signal/micro/kernels/fft_auto_scale_common.o \
./tflm-tree/signal/micro/kernels/fft_auto_scale_kernel.o \
./tflm-tree/signal/micro/kernels/filter_bank.o \
./tflm-tree/signal/micro/kernels/filter_bank_log.o \
./tflm-tree/signal/micro/kernels/filter_bank_spectral_subtraction.o \
./tflm-tree/signal/micro/kernels/filter_bank_square_root.o \
./tflm-tree/signal/micro/kernels/filter_bank_square_root_common.o \
./tflm-tree/signal/micro/kernels/framer.o \
./tflm-tree/signal/micro/kernels/irfft.o \
./tflm-tree/signal/micro/kernels/overlap_add.o \
./tflm-tree/signal/micro/kernels/pcan.o \
./tflm-tree/signal/micro/kernels/rfft.o \
./tflm-tree/signal/micro/kernels/stacker.o \
./tflm-tree/signal/micro/kernels/window.o 


# Each subdirectory must supply rules for building sources it contributes
tflm-tree/signal/micro/kernels/delay.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/delay.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/energy.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/energy.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/fft_auto_scale_common.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/fft_auto_scale_common.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/fft_auto_scale_kernel.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/fft_auto_scale_kernel.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/filter_bank.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/filter_bank_log.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_log.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/filter_bank_spectral_subtraction.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_spectral_subtraction.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/filter_bank_square_root.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_square_root.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/filter_bank_square_root_common.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/filter_bank_square_root_common.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/framer.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/framer.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/irfft.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/irfft.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/overlap_add.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/overlap_add.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/pcan.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/pcan.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/rfft.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/rfft.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/stacker.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/stacker.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

tflm-tree/signal/micro/kernels/window.o: C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/tflm-tree/signal/micro/kernels/window.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -DTF_LITE_STATIC_MEMORY -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS -Wall -O0 -g3 -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite/micro" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow/lite" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/tensorflow" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/flatbuffers/include" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/gemmlowp" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/ruy" -I"C:/Users/isaac/Dev/FPGA/ece532/ml_microblaze_opt/ml_microblaze_opt.sdk/fastdepth_runtime/../tflm-tree/third_party/kissfft" -c -fmessage-length=0 -MT"$@" -fno-exceptions -fno-rtti -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


