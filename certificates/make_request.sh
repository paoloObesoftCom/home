#!/bin/sh
if [ $# -ne 0 ]; then
	if [ -e $1.conf ]; then
		rm $1.key $1.csr $1.cer
		openssl req -new -out $1.csr -nodes -keyout $1.key -config $1.conf
		cat $1.csr
		openssl req -in $1.csr -noout -text
	else
		echo "Configuration file '$1.conf' not found!"
	fi
else
	echo "Usage : $0 {'certificate name'}"
fi
