#! /bin/bash
if [ ! -e ${0%/*}/.env ]
then
   echo "Merci de créer les conteneurs du projet avant d'utiliser cette commande."
   exit 1
fi

while read line  
do   
    if [ ! -z "$line" ]
    then
        export $line
    fi
done < ${0%/*}/.env

rm -f -r "/tmp/install_sgbd.txt"

TAB_INSTALL=()

if [ -e "${0%/*}/table_install.txt" ]
then
    while read line  
    do   
        if [ ! -z "$line" ]
        then
            TAB_INSTALL+=("$line")
        fi
    done < "${0%/*}/table_install.txt"
fi

for entry in `ls ${0%/*}/*.json 2> "/tmp/install_sgbd.txt"`; do

    IS_RECUP="true"

    for value in "${TAB_INSTALL[@]}"
    do
        if [ "$value" = "$entry" ]
        then
            IS_RECUP="false"
        fi
    done

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

        mongoimport -u=$SGBD_ROOT_USERNAME -p=$SGBD_ROOT_PASSWORD -h=mongo --authenticationDatabase=admin --db $SGBD_DATABASE --collection $nameTabSGBD --type json --file /mongo-seed/$entry --jsonArray
        echo "$entry" >> "${0%/*}/table_install.txt"

    fi
done

rm -f -r "/tmp/install_sgbd.txt"
