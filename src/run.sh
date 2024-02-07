#!/bin/bash

set -eu

if [ -z "$SCHEDULE" ]; then
  sh backup.sh
else
  exec go-cron "$SCHEDULE" /bin/bash backup.sh
fi
