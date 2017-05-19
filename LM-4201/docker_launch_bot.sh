#!/bin/bash

# Get the script parameters from the environment or prompt user if needed
if [ $ANYCONNECT_HOSTNAME ] ; then
    vpnhost=$ANYCONNECT_HOSTNAME
else
    read -p "AnyConnect Hostname:  " vpnhost
fi

if [ $ANYCONNECT_USERNAME ] ; then
    vpnuser=$ANYCONNECT_USERNAME
else
    read -p "AnyConnect Username:  " vpnuser
fi

if [ $ANYCONNECT_PASSWORD ] ; then
    vpnpass=$ANYCONNECT_PASSWORD
else
    read -sp "AnyConnect Password:  " vpnpass
    echo ""
fi

if [ $SPARK_EMAIL ] ; then
    sparkemail=$SPARK_EMAIL
else
    read -p "Spark E-Mail Address:  " sparkemail
fi


# Setup OpenConnect VPN connection
echo $vpnpass | openconnect  -b -q --syslog --no-cert-check --no-dtls $vpnhost --user=$vpnuser --passwd-on-stdin


# Start Demo Bot
python3 demo_bot.py --email $sparkemail
