#!/bin/bash

PORT=7777
IP_CLIENT=localhost

echo "LSTP Server (Lechuga Speaker Transfer Protocol)"

echo "0. LISTEN"

DATA=`nc -l $PORT`

echo "3.CHECK"

if [ "$DATA" != "LSTP_1" ]
then
	echo "ERROR 1: Header mal formado $DATA"

	echo "KO_HEADER" | nc localhost $PORT

	exit 1
fi

echo "4.SEND OK_HEADER" 

echo "OK_HEADER" | nc localhost $PORT

echo "5.LISTEN FILE_NAME"

DATA=`nc -l $PORT`

echo "9.CHECK FILE_NAME"

PREFIX=`echo $DATA | cut -d " " -f 1`

if [ "$PREFIX" != "FILE_NAME" ]
then
	echo "ERROR 2: FILE_NAME incorrecto"

	echo "KO_FILE_NAME" |  $IP_CLIENT $PORT

	exit 2
fi

FILE_NAME=`echo $DATA | cut -d " " -f 2`



echo "10. SEND OK_FILE_NAME"

echo "OK_FILE_NAME" | nc $IP_CLIENT $PORT

echo "11. LISTEN FILE DATA"

nc -l $PORT > server/$FILE_NAME
