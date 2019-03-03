#!/bin/bash
# install irods

# start database
service postgresql start

# prep ICAT
# 
cd /var/lib/postgresql
sudo -u postgres psql -c "CREATE USER irods WITH PASSWORD 'irods' " 
sudo -u postgres psql -c 'CREATE DATABASE "ICAT" ' 
sudo -u postgres psql -c 'GRANT ALL PRIVILEGES ON DATABASE "ICAT" TO irods ' 

# install iRODS
#
python /var/lib/irods/scripts/setup_irods.py

# stop database
service postgresql stop

# 
echo ''
echo ' launch the stack with ./start.sh '
echo ''
