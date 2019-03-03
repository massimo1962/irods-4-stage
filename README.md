# irods-4-stage
build and launch irods-4-stage (with icat database embedded)

## :: up and running in 3 step ::


# 1 
put the rigth values into installer.sh file (db icat username and password are hardcoded ): 
### vi installer.sh  

# 2 
run install all:
### ./setup.sh

answer to interactive iRODS installation:
(almost default value could be ok)

attention on
```
icat-section-------------------------------------------
user/passwd of icat db : same of installer

irods-section------------------------------------------
adminuser:rods password:choosePAsswd  

insert keys that will be used for federation-----------
"zone_key": "XOXOXO_ZONE_SID"
"negotiation_key": "xxxx_32_byte_key_for_agent__conn",
"server_control_plane_key": "TEMPORARY__32byte_ctrl_plane_key"
```


# 3 
run irods-4-stage:
### ./start.sh 


enjoy!
</br></br>
to check if it's works:
*docker exec -it --user irods irods-4-stage ils*

if response is something like '/tempZone/home/rods' :

 it's ok, irods-4-stage is up and running.

else : 

 try with restart irods command
 *docker exec -it --user irods irods-4-stage /var/lib/irods/irodsctl restart*
 (sometime postgresql have some delay)


# DATA 
it's availible a docker volume called 'area-stage' for data sharing
