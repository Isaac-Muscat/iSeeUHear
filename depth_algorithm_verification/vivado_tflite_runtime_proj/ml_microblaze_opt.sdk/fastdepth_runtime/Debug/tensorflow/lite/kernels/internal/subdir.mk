################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow/lite/kernels/internal/common.cc \
../tensorflow/lite/kernels/internal/portable_tensor_utils.cc \
../tensorflow/lite/kernels/internal/quantization_util.cc \
../tensorflow/lite/kernels/internal/runtime_shape.cc \
../tensorflow/lite/kernels/internal/tensor_ctypes.cc \
../tensorflow/lite/kernels/internal/tensor_utils.cc 

CC_DEPS += \
./tensorflow/lite/kernels/internal/common.d \
./tensorflow/lite/kernels/internal/portable_tensor_utils.d \
./tensorflow/lite/kernels/internal/quantization_util.d \
./tensorflow/lite/kernels/internal/runtime_shape.d \
./tensorflow/lite/kernels/internal/tensor_ctypes.d \
./tensorflow/lite/kernels/internal/tensor_utils.d 

OBJS += \
./tensorflow/lite/kernels/internal/common.o \
./tensorflow/lite/kernels/internal/portable_tensor_utils.o \
./tensorflow/lite/kernels/internal/quantization_util.o \
./tensorflow/lite/kernels/internal/runtime_shape.o \
./tensorflow/lite/kernels/internal/tensor_ctypes.o \
./tensorflow/lite/kernels/internal/tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow/lite/kernels/internal/%.o: ../tensorflow/lite/kernels/internal/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


