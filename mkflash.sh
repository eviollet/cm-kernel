#!/bin/sh



localVersion=`cat .config | fgrep CONFIG_LOCALVERSION= | cut -f 2 -d= | sed s/\"//g`
linuxVersion=`cat .config | fgrep "Linux kernel version:" | cut -d: -f 2 | cut -c2-`
VERSION=$linuxVersion$localVersion
echo "Kernel version=$VERSION"


rm -rf flash/system/lib/modules/*
mkdir flash/system/lib/modules/$VERSION
mkdir flash/system/lib/modules/$VERSION/kernel
tar czf modules.tgz `find . -name '*.ko'` 
cd flash/system/lib/modules/$VERSION/kernel
tar xzf ../../../../../../modules.tgz
cd - > /dev/null
rm modules.tgz

#cd flash/system/lib/modules
#modules=`find . -name '*.ko'`
#for f in $modules
#do
#    ln -s $f
#done
#cd - > /dev/null

#modules=`find . -name '*.ko'`
#for f in $modules
#do
#    cp $f flash/system/lib/modules 2> /dev/null
#done

cp arch/arm/boot/zImage flash/kernel

rm -f kernel.zip 2> /dev/null
cd flash
zip -r --quiet  ../kernel.zip .
cd ..