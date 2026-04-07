################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../signal/micro/kernels/delay.cc \
../signal/micro/kernels/energy.cc \
../signal/micro/kernels/fft_auto_scale_common.cc \
../signal/micro/kernels/fft_auto_scale_kernel.cc \
../signal/micro/kernels/filter_bank.cc \
../signal/micro/kernels/filter_bank_log.cc \
../signal/micro/kernels/filter_bank_spectral_subtraction.cc \
../signal/micro/kernels/filter_bank_square_root.cc \
../signal/micro/kernels/filter_bank_square_root_common.cc \
../signal/micro/kernels/framer.cc \
../signal/micro/kernels/irfft.cc \
../signal/micro/kernels/overlap_add.cc \
../signal/micro/kernels/pcan.cc \
../signal/micro/kernels/rfft.cc \
../signal/micro/kernels/stacker.cc \
../signal/micro/kernels/window.cc 

CC_DEPS += \
./signal/micro/kernels/delay.d \
./signal/micro/kernels/energy.d \
./signal/micro/kernels/fft_auto_scale_common.d \
./signal/micro/kernels/fft_auto_scale_kernel.d \
./signal/micro/kernels/filter_bank.d \
./signal/micro/kernels/filter_bank_log.d \
./signal/micro/kernels/filter_bank_spectral_subtraction.d \
./signal/micro/kernels/filter_bank_square_root.d \
./signal/micro/kernels/filter_bank_square_root_common.d \
./signal/micro/kernels/framer.d \
./signal/micro/kernels/irfft.d \
./signal/micro/kernels/overlap_add.d \
./signal/micro/kernels/pcan.d \
./signal/micro/kernels/rfft.d \
./signal/micro/kernels/stacker.d \
./signal/micro/kernels/window.d 

OBJS += \
./signal/micro/kernels/delay.o \
./signal/micro/kernels/energy.o \
./signal/micro/kernels/fft_auto_scale_common.o \
./signal/micro/kernels/fft_auto_scale_kernel.o \
./signal/micro/kernels/filter_bank.o \
./signal/micro/kernels/filter_bank_log.o \
./signal/micro/kernels/filter_bank_spectral_subtraction.o \
./signal/micro/kernels/filter_bank_square_root.o \
./signal/micro/kernels/filter_bank_square_root_common.o \
./signal/micro/kernels/framer.o \
./signal/micro/kernels/irfft.o \
./signal/micro/kernels/overlap_add.o \
./signal/micro/kernels/pcan.o \
./signal/micro/kernels/rfft.o \
./signal/micro/kernels/stacker.o \
./signal/micro/kernels/window.o 


# Each subdirectory must supply rules for building sources it contributes
signal/micro/kernels/%.o: ../signal/micro/kernels/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../fastdepth_runtime_bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v11.0 -mno-xl-soft-mul -mxl-multiply-high -mhard-float -mxl-float-convert -mxl-float-sqrt -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


