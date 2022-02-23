#!/bin/bash

TEXTFILES_DIR="/var/lib/node_exporter/textfiles"

echo "Outputting to $TEXTFILES_DIR"

# sed -ne 's/^\([0-9]\+\)\t\(.*\)$/node_directory_size_bytes{directory="\2"} \1/p'

ls -l /dev/disk/by-id |
  sed -nr 's/.*ata-(\S*)\s.*(sd[a-z])$/node_disk_ids{device="\2",id="\1"} 1/p' > $TEXTFILES_DIR/disk_ids.prom.$$ &&
  mv $TEXTFILES_DIR/disk_ids.prom.$$ $TEXTFILES_DIR/disk_ids.prom
