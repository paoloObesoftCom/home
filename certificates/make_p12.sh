#!/bin/sh
if [ $# -ne 0 ]; then
	if [ -e $2.cer ] && [ -e $2.key ]; then
		request="-export -certpbe PBE-SHA1-3DES -keypbe PBE-SHA1-3DES -nomac -out ${1}.p12 -inkey ${2}.key -in ${2}.cer"
		#if [ -e $3 ]; then 	
			#request="${request} -certfile ${3}"
		#fi
		echo $request
		openssl pkcs12 $request
	else
		echo "Certificate file 'filename.cer or filename.key' not found!"
	fi
else
	echo "Usage : $0 {'certificate name (www.example.com)','certificate files (without .key, .cer)'}"
fi
