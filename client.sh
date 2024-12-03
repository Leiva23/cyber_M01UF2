#!/bin/bash

echo "LSTP Client (Lechuga Speaker Transfer Protocol)"

echo "1. SEND HEADER"

echo "LSTP_1" | nc localhost 7777

echo "2.LISTEN OK_HEADER"

DATA=`nc -l 7777`

echo "6.CHECK OK_HEADER"
if [ "$DATA" != "OK_HEADER" ]
then
	echo "ERROR 1: Header enviado correctamente"

	exit 1
fi



#cat client/lechuga.lechu | text2wave -o client/lechuga1.wav

#yes | ffmpeg -i client/lechuga1.wav client/lechuga1.ogg

echo "FILE_NAME client/lechuga1.wav" | nc localhost 7777






