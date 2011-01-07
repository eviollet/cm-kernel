#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage : $0 <nom du noyau>"
    exit
fi

kernelBaseName=$1

for kernel in HAVS-AXI-128-BFS HAVS-128-BFS SVS-AXI-128-BFS SVS-128-BFS HAVS-AXI-128-CFS HAVS-128-CFS SVS-AXI-128-CFS SVS-128-CFS
do
    echo "************************************"
    echo "***** Make $kernel ...."
    echo "************************************"
    cp .config-$kernel .config
    if [ ! $? -eq 0 ]
    then
	exit
    fi
#    make clean
    make
    if [ ! $? -eq 0 ]
    then
	exit
    fi
    cp .config .config-$kernel
    ./mkflash.sh
    zipName=$kernelBaseName-$kernel.zip
    rm -f $zipName
    mv kernel.zip $zipName
    cp $zipName /media/droopyTemp/DeFrostKernels
done
