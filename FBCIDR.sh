#!/bin/bash
FILE=./FBRange.txt
DATE=
if test -f "$FILE"; then
	echo "FB CIDR range already defined. Chjecking to see if file matches up to date list."
	`whois -h whois.radb.net -- '-i origin AS32934' | grep -Eo "([0-9.]+){4}/[0-9]+" | head > T_FBRange.txt`
	T_FILE=T_FBRange.txt
	MD5SUM = `md5sum $FILE`
	T_MD5SUM= `md5sum $T_FILE`
	if [ $MD5SUM = $T_MD5SUM ]; then
		echo "Files are identical. Not changing anything."
	else
		rm FBRange.txt
		mv T_FBRange.txt FBRange.txt
		touch Updated-`date +%F`
	fi
else
	echo "FB CIDR range not defined"
	`whois -h whois.radb.net -- '-i origin AS32934' | grep -Eo "([0-9.]+){4}/[0-9]+" | head > FBRange.txt`
fi	
