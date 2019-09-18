#!/bin/bash -eux

echo "start"

# environment check
function environment_check ()
{
    ENV_KEY=$1
    ENV_VALUE=$2
    if [ -z $ENV_VALUE ] ; then
        echo "$ENV_KEY not setting."
        exit;
    fi
}

environment_check CLONE_URL $CLONE_URL
environment_check CLONE_URL_HOST $CLONE_URL_HOST
environment_check ID_RSA $ID_RSA
environment_check REPOSITORY $REPOSITORY

# configure
#  ID_RSA -> generate next command: cat [key file] | sed -e :loop -e 'N; $!b loop' -e 's/\n/\\n/g'
mkdir -p ~/.ssh
echo $ID_RSA | sed -e 's/\\n/\n/g' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan $CLONE_URL_HOST >> ~/.ssh/known_hosts

# source clone
mkdir -p ~/git
cd ~/git
git clone $CLONE_URL

# source script start
cd $REPOSITORY
sh start.sh
