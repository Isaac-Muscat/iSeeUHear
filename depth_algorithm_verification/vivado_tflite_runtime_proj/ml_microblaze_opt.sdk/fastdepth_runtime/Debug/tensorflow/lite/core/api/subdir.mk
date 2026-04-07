################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow/lite/core/api/flatbuffer_conversions.cc \
../tensorflow/lite/core/api/tensor_utils.cc 

CC_DEPS += \
./tensorflow/lite/core/api/flatbuffer_conversions.d \
./tensorflow/lite/core/api/tensor_utils.d 

OBJS += \
./tensorflow/lite/core/api/flatbuffer_conversions.o \
./tensorflow/lite/core/api/tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow/lite/core/api/%.o: ../tensorflow/lite/core/api/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


