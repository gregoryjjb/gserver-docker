#! /bin/bash

logdir="`dirname "$0"`/logs"
logpath="$logdir/`date +%F_%H%M`.log"
echo "Savings logs to $logpath"

docker exec rclone rclone copy \
  "google-drive-gregoryjjb:/" "/data/google-drive-gregoryjjb" \
  --config /data/.config/rclone.conf \
  --cache-dir /data/.cache \
  --bwlimit 10M \
  --verbose \
  2>&1 | tee $logpath

# Clean old logs
find $logdir ! -newermt `date --date="30 days ago" -I` -delete
