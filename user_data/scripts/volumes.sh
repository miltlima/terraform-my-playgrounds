#!/bin/bash

set -ex

vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE} || echo ""`
if ["`echo -n $DEVICE_FS`" == ""] ; then
  DEVICE_NAME= `echo "${DEVICE} | awk -F '/' '{print $3}'`
  DEVICE_EXISTS=''
  while [[ -z $DEVICE_EXISTS ]]; do
    echo "checking $DEVICE_NAME"
    DEVICE_EXISTS= `lsblk | grep "$DEVICE_NAME" | wc -l` 
    if [[ DEVICE_EXISTS != "1" ]]; then
      sleep 15
    fi
  done 
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume-extra -l 100%FREE data
  mkfs.ext4 /dev/data/volume-extra
fi 
mkdir -p /data
echo '/dev/data/volume-extra /data ext4 defaults 0 0' >> /etc/fstab
mount /data

curl https://get.docker.com | bash