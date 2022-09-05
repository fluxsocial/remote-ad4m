#!/bin/bash

set -e

echo "Start to run ad4m."

ADMIN_TOKEN=$(uuidgen)
PORT=12000
echo "Serve ad4m, port: $PORT, credential: $ADMIN_TOKEN"

./ad4m serve --reqCredential $ADMIN_TOKEN --port $PORT

