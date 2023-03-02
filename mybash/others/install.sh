#!/usr/bin/env bash

OS_NAME=$(uname)

installDependencies() {
    # needed for local stack
    pip3 install awscli-local 

    # Needed for redis-cli
    brew install redis
}

main() {
    if [ $OS_NAME != 'Darwin' ]; then
        echo "Must mbe run on a mac"
        exit 1
    fi
    installDependencies
}

main
