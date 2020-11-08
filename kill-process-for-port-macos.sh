#!/bin/bash

# https://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac

if [ $(uname) = 'Darwin' ]; then
  if [ $# -eq 0 ]; then
    echo 'Usage:'
    echo '      Please specify a port to kill the process.'
    exit 1
  fi
  if [ $# -eq 1 ]; then
    # https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]]; then
      echo "$1 is not a valid number." >&2
      exit 1
    fi
    process_to_kill=$(lsof -t -i tcp:$1)
    if [ ${#process_to_kill} -eq 0 ]; then
      echo "There is no process to kill on port $1."
      exit 1
    fi

    echo '**Process Details**'
    echo ''
    lsof -i tcp:$1
    # lsof -t -i tcp:$1 | xargs kill

    kill $process_to_kill && echo "SUCCESS: kill $process_to_kill" || echo "ERROR: kill $process_to_kill"
  else
    echo 'Too many arguments: Please specify a port to kill the process.'
    exit 1
  fi
else
  echo 'This script only works in macOS.'
  echo 'The Linux version is to be implemented later...'
fi
