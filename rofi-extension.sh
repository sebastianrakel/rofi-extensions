#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

case $1 in
"subtle_change_view")
  ruby "${SCRIPTPATH}/subtle/subtle_rofi.rb"
  ;;
*)
  echo "Select Option"
  ;;
esac
    