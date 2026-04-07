################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../signal/src/circular_buffer.cc \
../signal/src/energy.cc \
../signal/src/fft_auto_scale.cc \
../signal/src/filter_bank.cc \
../signal/src/filter_bank_log.cc \
../signal/src/filter_bank_spectral_subtraction.cc \
../signal/src/filter_bank_square_root.cc \
../signal/src/irfft_float.cc \
../signal/src/irfft_int16.cc \
../signal/src/irfft_int32.cc \
../signal/src/log.cc \
../signal/src/max_abs.cc \
../signal/src/msb_32.cc \
../signal/src/msb_64.cc \
../signal/src/overlap_add.cc \
../signal/src/pcan_argc_fixed.cc \
../signal/src/rfft_float.cc \
../signal/src/rfft_int16.cc \
../signal/src/rfft_int32.cc \
../signal/src/square_root_32.cc \
../signal/src/square_root_64.cc \
../signal/src/window.cc 

CC_DEPS += \
./signal/src/circular_buffer.d \
./signal/src/energy.d \
./signal/src/fft_auto_scale.d \
./signal/src/filter_bank.d \
./signal/src/filter_bank_log.d \
./signal/src/filter_bank_spectral_subtraction.d \
./signal/src/filter_bank_square_root.d \
./signal/src/irfft_float.d \
./signal/src/irfft_int16.d \
./signal/src/irfft_int32.d \
./signal/src/log.d \
./signal/src/max_abs.d \
./signal/src/msb_32.d \
./signal/src/msb_64.d \
./signal/src/overlap_add.d \
./signal/src/pcan_argc_fixed.d \
./signal/src/rfft_float.d \
./signal/src/rfft_int16.d \
./signal/src/rfft_int32.d \
./signal/src/square_root_32.d \
./signal/src/square_root_64.d \
./signal/src/window.d 

OBJS += \
./signal/src/circular_buffer.o \
./signal/src/energy.o \
./signal/src/fft_auto_scale.o \
./signal/src/filter_bank.o \
./signal/src/filter_bank_log.o \
./signal/src/filter_bank_spectral_subtraction.o \
./signal/src/filter_bank_square_root.o \
./signal/src/irfft_float.o \
./signal/src/irfft_int16.o \
./signal/src/irfft_int32.o \
./signal/src/log.o \
./signal/src/max_abs.o \
./signal/src/msb_32.o \
./signal/src/msb_64.o \
./signal/src/overlap_add.o \
./signal/src/pcan_argc_fixed.o \
./signal/src/rfft_float.o \
./signal/src/rfft_int16.o \
./signal/src/rfft_int32.o \
./signal/src/square_root_32.o \
./signal/src/square_root_64.o \
./signal/src/window.o 


# Each subdirectory must supply rules for building sources it contributes
signal/src/%.o: ../signal/src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


