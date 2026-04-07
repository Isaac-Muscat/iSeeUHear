################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow/lite/kernels/internal/reference/comparisons.cc \
../tensorflow/lite/kernels/internal/reference/portable_tensor_utils.cc 

CC_DEPS += \
./tensorflow/lite/kernels/internal/reference/comparisons.d \
./tensorflow/lite/kernels/internal/reference/portable_tensor_utils.d 

OBJS += \
./tensorflow/lite/kernels/internal/reference/comparisons.o \
./tensorflow/lite/kernels/internal/reference/portable_tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow/lite/kernels/internal/reference/%.o: ../tensorflow/lite/kernels/internal/reference/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


