#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage : $0 <nom du noyau>"
    exit
fi

kernelBaseName=$1

for kernel in GB-HAVS-AXI-128-CFS GB-HAVS-128-CFS GB-SVS-AXI-128-CFS GB-SVS-128-CFS GB-HAVS-AXI-128-BFS GB-HAVS-128-BFS GB-SVS-AXI-128-BFS GB-SVS-128-BFS
do
    echo "************************************"
    echo "***** Make $kernel ...."
    echo "************************************"
    fgrep -v "CONFIG_LOCALVERSION=" .config-$kernel > .config
    if [ ! $? -eq 0 ]
    then
	exit
    fi
    echo "CONFIG_LOCALVERSION=\"-$kernelBaseName-$kernel\"" >> .config
#    make clean
    make
    if [ ! $? -eq 0 ]
    then
	exit
    fi
    cp .config .config-$kernel
    ./mkflash.sh $kernelBaseName-$kernel
    zipName=$kernelBaseName-$kernel.zip
    rm -f $zipName
    mv kernel.zip $zipName
    cp $zipName /media/droopyTemp/DeFrostKernels
done
