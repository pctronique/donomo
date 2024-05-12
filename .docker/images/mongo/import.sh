#! /bin/bash

if [ -z ${MONGO_INITDB_ROOT_USERNAME} ] || [ -z ${MONGO_INITDB_ROOT_PASSWORD} ]
then
	cat >&2 <<-'EOF'

		error: missing 'MONGO_INITDB_ROOT_USERNAME' or 'MONGO_INITDB_ROOT_PASSWORD'
			    both must be specified for a user to be created

	EOF
	exit 1
fi

if [ -z ${MONGO_FOLDER_LOG} ]
then
    MONGO_FOLDER_LOG="/var/log/docker/mongo/"
fi

if [ -z ${MONGO_FOLDER_SGBD} ]
then
    MONGO_FOLDER_SGBD="/data/db/"
fi

if [ -z ${MONGO_FOLDER_IMPORT} ]
then
    MONGO_FOLDER_IMPORT="/docker-entrypoint-initdb.d/"
fi

if [ -z ${MONGO_INITDB_DATABASE} ]
then
    MONGO_INITDB_DATABASE="project"
fi

if [ -f "${MONGO_FOLDER_SGBD}/table_install.txt" ]
then
    exit 0
fi

msgconn=$(mongodump -u=${MONGO_INITDB_ROOT_USERNAME} -p=${MONGO_INITDB_ROOT_PASSWORD} -h=mongo --authenticationDatabase=admin 2>&1)

while [  $msgconn == *"Failed"* ]; do
    echo "Failed" >> ${MONGO_FOLDER_LOG}/failed.log
    sleep 0.2
done

echo "import_sgbd:true" >> "${MONGO_FOLDER_SGBD}/table_install.txt"

for entry in `ls ${MONGO_FOLDER_IMPORT}*.json`; do

    IS_RECUP="true"

    if [ "$IS_RECUP" = "true" ]
    then

        IFS='/' read -r -a TAB0 <<< "$entry"

        min=0
        max=$(( ${#TAB0[@]} -1 ))

        while [[ min -lt max ]]
        do
            # Swap current first and last elements
            x="${TAB0[$min]}"
            TAB0[$min]="${TAB0[$max]}"
            TAB0[$max]="$x"

            # Move closer
            (( min++, max-- ))
        done

        name="${TAB0[0]}"
        name=$(sed "s/.json//" <<< "$name")

        IFS='_' read -r -a TAB0C <<< "$name"

        nameTabSGBD="$name"

        if [ "${#TAB0C[@]}" -gt "1" ] ; then
            if [[ ${TAB0C[0]} =~ $RENUMB ]] ; then
                unset TAB0C[0]
                nameTabSGBD=$( IFS=$'_'; echo "${TAB0C[*]}" )
            fi
        fi

        mongoimport -u=${MONGO_INITDB_ROOT_USERNAME} -p=${MONGO_INITDB_ROOT_PASSWORD} -h=mongo --authenticationDatabase=admin --db ${MONGO_INITDB_DATABASE} --collection ${nameTabSGBD} --type json --file ${entry} --jsonArray
        echo "$entry" >> "${MONGO_FOLDER_SGBD}/table_install.txt"

    fi
done

exit 0
