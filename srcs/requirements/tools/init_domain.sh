#!/bin/bash

echo "### Enter your login name ###"
read login

echo "### Enter the server IP ###"
read ip

if grep -q -E "^$login.42.fr$" /etc/hosts; then
    echo "$login.42.fr exist!"
else
    echo "$login.42.fr create"
    echo "$ip $login.42.fr" >> /etc/hosts
fi
