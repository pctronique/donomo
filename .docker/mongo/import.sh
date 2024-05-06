#! /bin/bash
if [ ! -e ${0%/*}/.env ]
then
   echo "Merci de créer les conteneurs du projet avant d'utiliser cette commande."
   exit 1
fi

while read line  
do   
    line="$line" | xargs
    if [[ ! $line =~ ^# ]];
    then
        if [ ! -z "$line" ]
        then
            valuesenv+=("$line")
        fi
    fi
done < ${0%/*}/.env

if [ -f "${0%/*}/table_install.txt" ]
then
    exit 0
fi

echo "" >> "${0%/*}/table_install.txt"

for entry in `ls ${0%/*}/*.json`; do

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

        mongoimport -u=$SGBD_ROOT_USERNAME -p=$SGBD_ROOT_PASSWORD -h=mongo --authenticationDatabase=admin --db $SGBD_DATABASE --collection $nameTabSGBD --type json --file /mongo-seed/$entry --jsonArray
        echo "$entry" >> "${0%/*}/table_install.txt"

    fi
done

exit 0
