#!/bin/bash
# start irods

docker start irods-4-stage

docker exec -it irods-4-stage bash -c 'service postgresql start'

until docker exec -it --user postgres irods-4-stage psql -c "select 1" > /dev/null 2>&1; do sleep 2; done

docker exec -it --user irods irods-4-stage /var/lib/irods/irodsctl start
