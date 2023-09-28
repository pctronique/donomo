cd %~dp0\
bash -c "./install.sh --win %*"
docker compose up -d
bash -c "./start.sh"
bash -c "./bin/install/display_web.sh"
bash -c "rm -f -r ./tmp_install"
