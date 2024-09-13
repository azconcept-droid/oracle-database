#!/usr/bin/bash
# Oracle Database installation script
# Author: Yahya Azeez
# Date: 28/08/2024
# Usage: sudo bash install-oracle-db.sh

# Update your oracle linux
sudo dnf update

# Prequisites
echo "=========Install Prequisites========="
echo "yum install -y oracle-database-preinstall-19c"
yum install -y oracle-database-preinstall-19c

#Set the password for the "oracle" user.
echo "=======Set password for oracle user:==========="
echo "passwd oracle"
passwd oracle

# Create required directories

echo "========Create required directories==========="
mkdir -p /u01/app/oracle/product/19c/db_1/
mkdir -p /u01/app/oraInventory
mkdir -p /u01/app/oracle/oradata/
mkdir -p /u01/app/oracle/FRA/

# Set owner
echo "==========Set owner for directories============"
chown -R oracle:oinstall /u01/

# set permissions
chmod -R 775 /u01/

# switch to - oracle that has been installed by first command
su - oracle

# Edit a file here

#Add this to /home/oracle/db_install.rsp to silent install
oracle.install.responseFileVersion=/oracle/install/rspfmt_dbinstall_response_schema_v19.0.0
oracle.install.option=INSTALL_DB_SWONLY
UNIX_GROUP_NAME=oinstall
INVENTORY_LOCATION=/u01/app/oraInventory
ORACLE_HOME=/u01/app/oracle/product/19c/db_1/
ORACLE_BASE=/u01/app/oracle
oracle.install.db.InstallEdition=EE
oracle.install.db.OSDBA_GROUP=oinstall
oracle.install.db.OSOPER_GROUP=oinstall
oracle.install.db.OSBACKUPDBA_GROUP=oinstall
oracle.install.db.OSDGDBA_GROUP=oinstall
oracle.install.db.OSKMDBA_GROUP=oinstall
oracle.install.db.OSRACDBA_GROUP=oinstall
oracle.install.db.rootconfig.executeRootScript=false

# run the installer in silent mode
./runInstaller -silent -ignorePrereqFailure -responsefile /home/oracle/db_install.rsp