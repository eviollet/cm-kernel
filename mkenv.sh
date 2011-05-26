export ARCH=arm
export _XXCFLAGS="-march=armv7-a -mfpu=neon -mfloat-abi=softfp -mtune=cortex-a8 -fomit-frame-pointer -fno-math-errno -fno-signed-zeros -fno-tree-vectorize -O3 -Ofast --strip-unneeded"
export CROSS_COMPILE=arm-linux-gnueabi-
#export PATH=$PATH:/kernel/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin
#export C_INCLUDE_PATH=/usr/include/qt3:/usr/include/qt4/Qt:/usr/include/qt3
#export CPLUS_INCLUDE_PATH=/usr/include/qt3:/usr/include/qt4/Qt:/usr/include/qt3
