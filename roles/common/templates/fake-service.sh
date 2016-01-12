#!/bin/sh

NAME="{{service_name}} ($$)"
if [ -n "$1" ]; then
  NAME="$NAME - $1 -"
fi

echo "$NAME starting"
trap 'stop' INT TERM

function stop() {
  echo "$NAME stopping"
  exit
}

while true; do
  echo "$NAME"
  sleep 10
done
