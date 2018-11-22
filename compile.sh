#!/bin/bash
#cobc -x -Wall *.c
cobc -x -Wall tcpipserver.cob
#cobc -x -Wall err*.cob

chmod a+x tcpipserver
echo "./tcpipserver localhost 8080"

