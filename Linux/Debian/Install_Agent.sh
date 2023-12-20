#!/bin/bash

stty size | perl -ale 'print "-"x$F[1]'
echo "Agent installation"

read -p "Do You want to continue? [Y/N] : " Start
if [ "$Start" == "N" ] || [ "$Start" == "n" ];
    then
        exit 0
    fi
stty size | perl -ale 'print "-"x$F[1]'
curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.5.2-1_amd64.deb && sudo WAZUH_MANAGER='178.218.246.60' WAZUH_AGENT_GROUP='Agent_Group' WAZUH_AGENT_NAME='Agent_Name' dpkg -i ./wazuh-agent.deb
isok=true
while $isok
do
    read -p "Enter provided client port: " clientport
    read -p "Enter provided enrollment port: " enrollmentport
    read -p "Enter name for Wazuh Agent: " wazuhagentname
    read -p "Enter group name for Wazuh Agent: " wazuhagentgroup
    read -p "Those are correct? [Y/N]: " yesorno
    if [ "$yesorno" == "Y" ] || [ "$yesorno" == "y" ];
    then
        isok=false
    fi
done
stty size | perl -ale 'print "-"x$F[1]'

ConfigFile="/var/ossec/etc/ossec.conf"

sed -i "s/<port>1514<\/port>/<port>$clientport<\/port>/g" $ConfigFile
sed -i "s/<agent_name>Agent_Name<\/agent_name>/<agent_name>$wazuhagentname<\/agent_name>\n      <port>$enrollmentport<\/port>/g" $ConfigFile
sed -i "s/<groups>Agent_Group<\/groups>/<groups>$wazuhagentgroup<\/groups>/g" $ConfigFile

systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
