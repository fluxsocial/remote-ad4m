#!/bin/bash

set -e

echo "Start to run ad4m."

# only run if ad4m binary is not exist
if [ ! -f ./ad4m ]; then
    echo "Download ad4m binary."
    unameOut="$(uname -s)"

    case "${unameOut}" in
        Linux*)     AD4M_HOST_BINARY=https://github.com/perspect3vism/ad4m/releases/download/v0.2.16/ad4m-linux-0.2.16-x64;;
        Darwin*)    AD4M_HOST_BINARY=https://github.com/perspect3vism/ad4m/releases/download/v0.2.16/ad4m-macos-0.2.16-x64;;
        *)          echo "Machine is not supported: ${unameOut}" && exit 1;;
    esac

    wget -O ad4m $AD4M_HOST_BINARY
    chmod 755 ad4m
fi

# only run init if holochain binary is not exist
if [ ! -f ~/.ad4m/binary/holochain ]; then
    echo "Init ad4m."
    ./ad4m init
fi

if [ ! -f ~/.ad4m/admin-token ]; then
    echo "generate token"
    echo $(uuidgen) > ~/.ad4m/admin-token
fi

ADMIN_TOKEN=`cat ~/.ad4m/admin-token`
PORT=12000
echo "Serve ad4m, port: $PORT, credential: $ADMIN_TOKEN"

./ad4m serve --reqCredential $ADMIN_TOKEN --port $PORT

