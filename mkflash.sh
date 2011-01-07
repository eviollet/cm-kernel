#!/bin/sh

modules=`find . -name '*.ko'`
for f in $modules
do
    cp $f flash/system/lib/modules 2> /dev/null
done

cp arch/arm/boot/zImage flash/kernel

cd flash
zip -r ../kernel.zip .
cd ..