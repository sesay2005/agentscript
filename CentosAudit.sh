#!/bin/bash

#Description: Centos7 Audit
#Author: Aruna Bakarr Sesay
#Date: August 2016


echo -e "\n********************\n" > /var/log/centos7audit-$(date +%F)
echo -e "\n*****Centos 7 audit*****\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n********************\n"   >> /var/log/centos7audit-$(date +%F)

## Check hosts file

echo -e "\n Check the hosts file\n" >> /var/log/centos7audit-$(date +%F)
 if [ -f /etc/hosts ] ; then
    echo "File /etc/hosts exist" >> /var/log/centos7audit-$(date +%F)
 else
   echo "File /etc/hosts does not exist" >> /var/log/centos7audit-$(date +%F)
 fi

## CHeck Selinux

echo -e "\nChecking selinus\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\n The selinux is set to $(getenforce) \n" >> /var/log/centos7audit-$(date +%F)

## nobody user' uid

echo -e "\nCheck nobody's uid\n"  >> /var/log/centos7audit-$(date +%F)

echo -e "\nThe user nobody's uid is $(grep ^nobody /etc/passwd|awk -F: '{print$3}') \n" >> /var/log/centos7audit-$(date +%F)

## Check for samba package

echo -e "\nChecking samba package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep samba  >/dev/null 2>&1

  if [ $? -eq 0 ]; then
     echo -e "\n Package samba installed\n" >> /var/log/centos7audit-$(date +%F)
  else
     echo -e "\nPackage samba not installed\n" >> /var/log/centos7audit-$(date +%F)
  fi

## Check for curl package

echo -e "\nChecking curl package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep curl  >/dev/null 2>&1

  if [ $? -eq 0 ]; then
     echo -e "\n Package curl installed\n" >> /var/log/centos7audit-$(date +%F)
  else
     echo -e "\nPackage curl not installed\n" >> /var/log/centos7audit-$(date +%F)
  fi
## Check for docker package

echo -e "\nChecking docker package\n" >> /var/log/centos7audit-$(date +%F)
rpm -qa |grep docker  >/dev/null 2>&1

  if [ $? -eq 0 ]; then
     echo -e "\n Package docker installed\n" >> /var/log/centos7audit-$(date +%F)
  else
     echo -e "\nPackage docker not installed\n" >> /var/log/centos7audit-$(date +%F)
  fi
## Checking the auditd

echo -e "\nChecking the auditd\n" >> /var/log/centos7audit-$(date +%F)
systemctl status auditd | grep Loaded | awk -F";" '{print " auditd is"$2}' >> /var/log/centos7audit-$(date +%F)
systemctl status auditd | awk 'NR ==3 {print "auditd is " $3}' | tr -d '()' >> /var/log/centos7audit-$(date +%F)

## Check network file

echo -e "\n Check the network file\n" >> /var/log/centos7audit-$(date +%F)
 if [ -f /etc/sysconfig/network ] ; then
    echo "File /etc/sysconfig/network exist" >> /var/log/centos7audit-$(date +%F)
 else
   echo "File /etc/sysconfig/network does not exist" >> /var/log/centos7audit-$(date +%F)
 fi

## Check hostname

echo -e "\nThe hostname for this server is $(hostname) \n" >> /var/log/centos7audit-$(date +%F)

## Check hostname

echo -e "\nThe hostname for this server is $(hostname) \n" >> /var/log/centos7audit-$(date +%F)

##Check system bits

echo -e "\nThe system is $(getconf LONG_BIT) \n" >> /var/log/centos7audit-$(date +%F)

## What is the first digit of the kernel version

echo -e "\nWhat is the first digit of the kernel version\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\nThe first digit of the kernel version is $(uname -r | awk -F"." '{print $1}') >> /var/log/centos7audit-$(date +%F)

##What is the linux flavor running on this server

echo -e "\nWhat is the linux flavor running on this server\n" >> /var/log/centos7audit-$(date +%F)
echo -e "\nThe linux flavor running on this server is $(hostnamectl | awk -F"Operating System:" '{print $2}')  >> /var/log/centos7audit-$(date +%F)

## Check what is the ip address of this server

echo -e "\nCheck what is the ip address of the server\n"  >> /var/log/centos7audit-$(date +%F)
echo -e "\nThe ip address of the server is $(hostname -I | awk -F" " '{print $1}')  >> /var/log/centos7audit-$(date +%F)

##Check if there is a DNS entry in the /etc/resolv.conf file with 8.8.8.8
echo -e "\nCheck if there is a DNS entry in the /etc/resolv.conf file with 8.8.8.8\n"  >> /var/log/centos7audit-$(date +%F)
echo -e "\nThe DNS entry in the /etc/resolv.conf is $(grep nameserver /etc/resolv.conf)  >> /var/log/centos7audit-$(date +%F)

## Check the total size of the memory

echo -e "\nCheck the total size of the memory\n"  >> /var/log/centos7audit-$(date +%F)
cat /proc/meminfo | awk -F "MemTotal:" '{print $2}' >> /var/log/centos7audit-$(date +%F)
if
 [ $? -eq 0 ] ; then
 echo -e "\nThe memory size is check\n" >> /var/log/centos7audit-$(date +%F)
else
 echo -e "\nThe memory size is not check\n" >> /var/log/centos7audit-$(date +%F)
fi

