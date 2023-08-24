#!/bin/bash -eux

##
## Debian Network
## Install Network utilities
##


echo '> Installing Network utilities...'

apt-get install -y \
  ntp \
  curl \
  wget \
  rsync \
  telnet \
  mtr-tiny 

echo '> debian-network.sh is Done'
