#!/bin/bash

PORT=7777
IP_SERVER=localhost

echo "LSTP Client (Lechuga Speaker Transfer Protocol)"

echo "1. SEND HEADER"

echo "LSTP_1" | nc $IP_SERVER $PORT

echo "2.LISTEN OK_HEADER"

DATA=`nc -l $PORT`

echo "6.CHECK OK_HEADER"
if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: Header enviado incorrectamente"

	exit 1
fi



#cat client/lechuga.lechu | text2wave -o client/lechuga1.wav

#yes | ffmpeg -i client/lechuga1.wav client/lechuga1.ogg

echo "7.SEND FILE_NAME"

echo "FILE_NAME salida.ogg" | nc $IP_SERVER $PORT

echo "8.LISTEN"

DATA=`nc -l $PORT`

if [ "$DATA" != "OK_FILE_NAME" ]
then
	echo "ERROR 2: FILE_NAME mal enviado"

	exit 2
fi

echo "12. SEND FILE DATA"
cat salida.ogg | nc $IP_SERVER $PORT


echo "13.LISTEN OK/KO_FILE_DATA"
DATA=`nc -l $PORT`

if [ "$DATA" != "OK_FILE_DATA" ]
then
	echo "ERROR 3: Error al enviar los datos"
	exit 3
fi

echo "Fin"
exit 0






