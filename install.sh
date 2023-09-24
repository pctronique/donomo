#!/bin/bash
case "$1" in
  --del-port)
    rm -f -r "${0%/*}/.env"
    ;;
   
  --help)
    echo "$ .install.sh"
    echo "Ou"
    echo "$ .install.sh [option]"
    echo "Options:"
    echo "   --del-port : Pour modifier le numéros des ports."
    echo "   --helps    : Pour afficher l'aide."
    exit 0
    ;;

esac

if [ ! -e ${0%/*}/.env ]
then
  if ! ${0%/*}/bin/install/create_env_exp.sh ; then
    exit 1
  fi
fi

if [ -e ${0%/*}/install_tmp/type_install ]
then
  while read line  
  do   
    export $line
  done < ${0%/*}/install_tmp/type_install
else
  TYPE_INSTALL_PROJECT="update"
fi

mkdir -p ${0%/*}/projecttmp
mkdir -p ${0%/*}/projecttmp/logs
mkdir -p ${0%/*}/projecttmp/logs/pm2
mkdir -p ${0%/*}/projecttmp/tmp
mkdir -p ${0%/*}/projecttmp/tmp/nodejs
mkdir -p ${0%/*}/projecttmp/mongo_data
mkdir -p ${0%/*}/projecttmp/projecttmp/logs/nodejs

chmod 777 -R ${0%/*}/project
chmod 777 -R ${0%/*}/projecttmp

# creation du docker du projet
if docker-compose up --build -d ; then

  ${0%/*}/bin/import_sgbd.sh

  if [ $TYPE_INSTALL_PROJECT = "install" ]
  then
    if ! ${0%/*}/bin/createProject.sh ; then
      exit 1
    fi
  else
    if ! ${0%/*}/bin/updateProject.sh ; then
      exit 1
    fi
  fi

  ${0%/*}/start.sh

  rm -f -r "${0%/*}/install_tmp"

  ${0%/*}/bin/install/display_web.sh

fi
