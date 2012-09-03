#!/usr/bin/env bash

function=$1
action=$2
shift 2
args=$*

# Config file include following variables:
# $server # The host
# $user 
# $database_user 
# $database_pass 

config_file=$HOME/.server_utilities_config
if [ -f $config_file ] 
then
    source $config_file
else
    echo "Config file doesn't found, you need to create it first!"
fi

function database {

    # Export database and update remote 
    action=$1
    database=$2
    shift 2
    args=$*

    if [[ $action == 'export' ]] 
    then
        echo "Exporting $database ..."
        mysqldump -u $database_user --password=$database_pass $database > /tmp/$database.sql
        scp /tmp/$database.sql $user@$server:/tmp/$database.sql
        ssh $user@$server mysql -u $database_user --password=$database_pass $database < /tmp/$database.sql
        ssh $user@$server rm /tmp/$database.sql
        rm /tmp/$database.sql
    elif [[ $action == 'import' ]] 
    then
        echo "Importing $database ..."
        ssh $user@$server mysqldump -u $database_user --password=$database_pass $database | mysql -u $database_user --password=$database_pass $database 
    fi

}

$function $action $args
