#!/bin/sh

# Stops script execution if a command has an error
set -e

INSTALL_ONLY=0
# Loop through arguments and process them: https://pretzelhands.com/posts/command-line-flags
for arg in "$@"; do
    case $arg in
        -i|--install) INSTALL_ONLY=1 ; shift ;;
        *) break ;;
    esac
done

if ! hash robo3t 2>/dev/null; then
    echo "Installing Robo3T. Please wait..."
    cd $RESOURCES_PATH
    wget https://github.com/Studio3T/robomongo/releases/download/v1.4.2/robo3t-1.4.2-linux-x86_64-8650949.tar.gz -O ./robomongo.tar.gz
    mkdir robo3t
    tar xfz ./robomongo.tar.gz -C robo3t --strip-components=1
    chmod a+rwx ./robo3t/bin/robo3t
    ln -s $RESOURCES_PATH/robo3t/bin/robo3t /usr/local/bin/robo3t
    rm ./robomongo.tar.gz
else
    echo "Robo3T is already installed"
fi

# Run
if [ $INSTALL_ONLY = 0 ] ; then
    echo "Starting Robo3T..."
    echo "Robo3T is a GUI application. Make sure to run this script only within the VNC Desktop."
    robo3t
    sleep 10
fi
