#!/usr/bin/bash
# Oracle Database installation script
# Author: Yahya Azeez
# Date: 28/08/2024
# Usage: sudo bash install-oracle-db.sh



dnf install -y bc
dnf install -y binutils
dnf install -y compat-openssl11
dnf install -y elfutils-libelf
dnf install -y fontconfig
dnf install -y glibc
dnf install -y glibc-devel
dnf install -y ksh
dnf install -y libaio
dnf install -y libasan
dnf install -y liblsan
dnf install -y libX11
dnf install -y libXau
dnf install -y libXi
dnf install -y libXrender
dnf install -y libXtst
dnf install -y libxcrypt-compat
dnf install -y libgcc
dnf install -y libibverbs
dnf install -y libnsl
dnf install -y librdmacm
dnf install -y libstdc++
dnf install -y libxcb
dnf install -y libvirt-libs
dnf install -y make
dnf install -y policycoreutils
dnf install -y policycoreutils-python-utils
dnf install -y smartmontools
dnf install -y sysstat

dnf install -y glibc-headers
dnf install -y ipmiutil
dnf install -y libnsl2
dnf install -y libnsl2-devel
dnf install -y net-tools
dnf install -y nfs-utils 

# Added by me.
dnf install -y gcc
dnf install -y unixODBC

# Create new groups and users
groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54323 oper 
#groupadd -g 54324 backupdba
#groupadd -g 54325 dgdba
#groupadd -g 54326 kmdba
#groupadd -g 54327 asmdba
#groupadd -g 54328 asmoper
#groupadd -g 54329 asmadmin
#groupadd -g 54330 racdba

useradd -u 54321 -g oinstall -G dba,oper oracle

# Create directory
mkdir -p /u01/app/oracle/product/19.0.0/dbhome_1
mkdir -p /u02/oradata
chown -R oracle:oinstall /u01 /u02
chmod -R 775 /u01 /u02

#Set the password for the "oracle" user.
echo "Set password for oracle user: "
passwd oracle

