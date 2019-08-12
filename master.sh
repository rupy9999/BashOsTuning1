#!/bin/bash

sudo yum  -y update
sudo yum -y install vim wget
sudo sh -c  "echo 'master.rupeshorg.net' > /etc/hostname"
sudo sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
sudo sh -c "echo 'NETWORKING_IPV6=no' >> /etc/sysconfig/network"
sudo sh -c "echo 'HOSTNAME=master.rupeshorg.net' >> /etc/sysconfig/network"
sudo sh -c "echo 'vm.swappiness = 0' >> /etc/sysctl.conf"
sudo chmod +x /etc/rc.d/rc.local
sudo sh -c "echo 'echo never > /sys/kernel/mm/transparent_hugepage/defrag' >> /etc/rc.local"
sudo sh -c "echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local"
sudo wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
sudo yum -y localinstall jdk-8u131-linux-x64.rpm
java -version
