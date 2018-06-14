#!/bin/bash

set -e

if [ -f "/src/requirements.txt" ]
then
  pip install -r /src/requirements.txt
fi

cd /src/

exec "$@"
