#!/bin/bash

set -e

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     AD4M_HOST_BINARY=https://github.com/perspect3vism/ad4m-host/releases/download/v0.0.27/ad4m-linux-x64;;
    Darwin*)    AD4M_HOST_BINARY=https://github.com/perspect3vism/ad4m-host/releases/download/v0.0.27/ad4m-macos-x64;;
    *)          echo "Machine is not supported: ${unameOut}" && exit 1;;
esac

wget -O ad4m $AD4M_HOST_BINARY

chmod 755 ad4m

./ad4m init

ADMIN_TOKEN=$(uuidgen)
echo $ADMIN_TOKEN
./ad4m serve --reqCredential $ADMIN_TOKEN

