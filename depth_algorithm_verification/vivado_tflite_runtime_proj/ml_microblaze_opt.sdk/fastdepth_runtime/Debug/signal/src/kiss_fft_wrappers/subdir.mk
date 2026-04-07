################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../signal/src/kiss_fft_wrappers/kiss_fft_float.cc \
../signal/src/kiss_fft_wrappers/kiss_fft_int16.cc \
../signal/src/kiss_fft_wrappers/kiss_fft_int32.cc 

CC_DEPS += \
./signal/src/kiss_fft_wrappers/kiss_fft_float.d \
./signal/src/kiss_fft_wrappers/kiss_fft_int16.d \
./signal/src/kiss_fft_wrappers/kiss_fft_int32.d 

OBJS += \
./signal/src/kiss_fft_wrappers/kiss_fft_float.o \
./signal/src/kiss_fft_wrappers/kiss_fft_int16.o \
./signal/src/kiss_fft_wrappers/kiss_fft_int32.o 


# Each subdirectory must supply rules for building sources it contributes
signal/src/kiss_fft_wrappers/%.o: ../signal/src/kiss_fft_wrappers/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


