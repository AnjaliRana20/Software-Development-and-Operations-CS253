#!/bin/bash 

ScPID1=$(ps -ef | grep "script.sh" | sed -n 1p | awk '{print $2}')
ScPID2=$(ps -ef | grep "script.sh" | sed -n 2p | awk '{print $2}')
ScPID3=$(ps -ef | grep "script.sh" | sed -n 3p | awk '{print $2}')

TPID1=$(ps -ef | grep "timeout" | grep $ScPID1 |awk '{print $2}')
TPID2=$(ps -ef | grep "timeout" | grep $ScPID2 |awk '{print $2}')
TPID3=$(ps -ef | grep "timeout" | grep $ScPID3 |awk '{print $2}')

BASHPID1=$(ps -ef | grep "bash" | grep $TPID1 |awk '{print $2}')
BASHPID2=$(ps -ef | grep "bash" | grep $TPID2 |awk '{print $2}')
BASHPID3=$(ps -ef | grep "bash" | grep $TPID3 |awk '{print $2}')

kill -9 $ScPID1 $ScPID2 $ScPID3 $BASHPID1 $BASHPID2 $BASHPID3 $TPID1 $TPID2 $TPID3 


