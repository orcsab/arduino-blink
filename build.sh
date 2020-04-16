#!/bin/zsh
RED="\033[1;31m"
NOCOLOR="\033[0m"

SERIAL="/dev/cu.usbserial-AK06TYUI"
FQBN="arduino:avr:uno"

arduino-cli compile --fqbn $FQBN .
if [ $? -eq 0 ]; then
  echo "compile successful"
else
  echo "${RED}compile exited with error code${NOCOLOR}"
  exit $?
fi

arduino-cli upload -t --fqbn $FQBN -p $SERIAL .
if [ $? -eq 0 ]; then
  echo "upload successful"
else
  echo "${RED}upload exited with error code${NOCOLOR}"
  exit $?
fi
