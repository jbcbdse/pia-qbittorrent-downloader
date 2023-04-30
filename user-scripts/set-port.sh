#!/bin/bash

# Mutate the qBittorrent configuration file to use the port forwarded from PIA in the vpn container
echo "Waiting 10 seconds because the port may not be set yet, and we won't know when the VPN has set it"
sleep 10
DAT_FILE=/pia-shared/port.dat
if [ -f $DAT_FILE ]; then
  PORT=$(cat $DAT_FILE)
  FILE="/config/qBittorrent/qBittorrent.conf"
  echo "Setting port to $PORT in $FILE"
  sed -i "s/\\(Session\\\\Port=\\)\\([[:digit:]]\\+\\)/\\1__how_do_i_backref_followed_by_numbers_${PORT}/g" $FILE
  sed -i 's/__how_do_i_backref_followed_by_numbers_//g' $FILE
fi
