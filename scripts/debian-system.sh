#!/bin/bash -eux

##
## Debian system
## Install system utilities
##

echo '> Installing System Utilities...'

apt-get install -y \
  jq \
  grc \
  git \
  tmux \
  htop \
  unzip \
  byobu 

echo '> Changing sysctl config'
echo "nf_conntrack_max=131072" >> /etc/sysctl.conf

echo '> Done'