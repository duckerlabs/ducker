#!/bin/bash

# Load the .env file if it is present
if [ -f .env ]; then
  set -a; source .env; set +a
fi

# Append the .duckdbrc file if it is present
if [ -f .duckdbrc ]; then
  envsubst < .duckdbrc >> $HOME/.duckdbrc
fi

# @Teggy got a yellow prompt working here: https://discord.com/channels/909674491309850675/1032769507183300668/1077973550583001138
#rlwrap -pyellow --always-readline /usr/local/bin/duckdb "$@"
exec /usr/local/bin/duckdb "$@"
