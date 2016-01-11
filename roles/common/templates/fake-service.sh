#!/bin/sh

NAME="{{service_name}} ($$)"

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
