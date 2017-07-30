#!/bin/bash

# based on script by JRH from thread/argument https://groups.google.com/forum/#!msg/comp.os.linux.networking/jSYlnUB1rDg/N6UUaqXsQWAJ thanks

getExternalIp(){
    #toDo pass other interface types

    externalInterface="ppp0"                # external interface, may be empty

    # get the external IP address - it returns empty string if it is not up
    if [ -n "$externalInterface" ]; then
        externalIp="`ifconfig $externalInterface  2>/dev/null | awk  \
        /$externalInterface/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"
    fi
    echo "  External IP: $externalIp";
}
