#!/usr/bin/env bash

USAGE="USAGE: $0 OPTION_NAME ON_STATE OFF_STATE"

OPTION_NAME=$1
ON_STATE=$2
OFF_STATE=$3

if [[ "$#" != 3 ]]; then
  echo $USAGE
  exit 1
fi

if [[ `tmux show-options | grep "$OPTION_NAME $ON_STATE"` ]]; then
  OPTION_VALUE=$OFF_STATE
else
  OPTION_VALUE=$ON_STATE
fi

tmux display-message "monitor-activity: $OPTION_NAME $OPTION_VALUE"
tmux set-option -w $OPTION_NAME $OPTION_VALUE > /dev/null
