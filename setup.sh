#!/bin/bash
# setup all 

docker build -t "dockerirods-aio:2" .

docker volume create area-stage

docker run -it --name irods-4-stage  -v /mnt/seedstore_nfs:/var/lib/datairods -v /opt/eudat/myrules:/var/lib/irods/myrules --mount source=area-stage,destination=/var/lib/irods/Vault -p 1247:1247 -p 1248:1248 -p 5432:5432 -p 20000-20199:20000-20199  dockerirods-aio:2 bash -c '/root/installer.sh'
