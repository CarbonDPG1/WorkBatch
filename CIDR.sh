#!/bin/bash
FILE=./FBRange.txt
DATE=
        echo "Rebuilding remotenet.conf using FB's ASN."
        `whois -h whois.radb.net -- '-i origin AS32934' | grep -Eo "([0-9.]+){4}/[0-9]+" | head > T_FBRange.txt`
        `sed -i -e 's/^/other Facebook /' T_FBRange.txt`
        `sed -i -e 's/$/  35/' T_FBRange.txt`
        `cat /store/configservices/deployed/globalconfig/remotenet.conf > remotenet.conf.bak`
        `cat /store/configservices/deployed/globalconfig/remotenet.conf | grep -ivE "Facebook" > remotenet.conf`
        `cat T_FBRange.txt >> remotenet.conf`
        `cp remotenet.conf /store/configservices/staging/globalconfig/`
        `rm T_FBRange.txt`
