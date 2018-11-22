#!/bin/bash
#cobc -x -Wall *.c
rm -f tcpipserver
rm -f tcpipserver.so
cobc -x -Wall tcpipserver.cob || exit 1 
#cobc -x -Wall err*.cob
chmod a+x tcpipserver
echo "./tcpipserver localhost 8080"

