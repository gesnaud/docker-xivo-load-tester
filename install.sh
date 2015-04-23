#!/bin/sh
DOCKER_APP="xivo-load-tester"
DOCKER_CONFIG_DIR="/etc/docker"
DOCKER_APP_LOG_DIR="/var/log/$DOCKER_APP"

mkdir -p $DOCKER_CONFIG_DIR/$DOCKER_APP/conf
cd $DOCKER_CONFIG_DIR/$DOCKER_APP 

mkdir $DOCKER_APP_LOG_DIR 
chown daemon:daemon $DOCKER_APP_LOG_DIR 

cat > docker-run.conf << EOF
-t
-d
--restart=always
--name=xivo-load-tester
-v $DOCKER_CONFIG_DIR/$DOCKER_APP/conf:/xivo-load-tester/etc
-v $DOCKER_APP_LOG_DIR:/xivo-load-tester/logs/
gesnaud/xivo-load-tester
EOF

echo "xivo-load-tester docker config init done."
echo "Now you have to update the configuration in the $DOCKER_CONFIG_DIR/$DOCKER_APP/conf."
echo "Than you can start xivo-load-tester by running 'docker run $(cat \$DOCKER_CONFIG_DIR/\$DOCKER_APP/docker-run.conf)'"
