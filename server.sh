#!/bin/bash

echo "LSTP Server (Lechuga Speaker Transfer Protocol)"

echo "0. LISTEN"

DATA=`nc -l 7777`

echo "3.CHECK"

if [ "$DATA" != "LSTP_1" ]
then
	echo "ERROR 1: Header mal formado $DATA"

	echo "KO_HEADER" | nc localhost 7777

	exit 1
fi

echo "4.SEND OK_HEADER" 

echo "OK_HEADER" | nc localhost 7777

echo "5.LISTEN FILE_NAME"
DATA=`nc -l 7777`






