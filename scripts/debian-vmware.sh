#!/bin/bash -eux

##
## VMware related stuff
## Install VMware related tools
##

echo '> Installing VMware Software...'

apt-get install -y \
  open-vm-tools \
  tar zip unzip wget \

## Get Tanu CLI
echo '> Getting Tanzu CLI from DALTOOLS'
cd /tmp
curl -O http://daltools.aanetworks.org/tanzu/tanzu-cli-bundle-linux-amd64.tar.gz
tar -zxvf tanzu-cli-bundle-linux-amd64.tar.gz
cd ./cli/
echo '> Installing tanzu cli binary'
sudo install core/v0.25.4/tanzu-core-linux_amd64 /usr/local/bin/tanzu
chmod +x /usr/local/bin/tanzu
tanzu init

# Install Tanzu plugins
echo '> Install Tanzu plugins'
cd /tmp/cli
tanzu plugin sync
sleep 5
tanzu plugin list
sleep 5

## Install Kubectl CLI
echo '> Downloading kubectl binary'
cd /tmp
curl -O http://daltools.aanetworks.org/tanzu/kubectl-linux-v1.23.10+vmware.1.gz
gunzip kubectl-linux-v1.23.10+vmware.1.gz
echo '> Installing kubectl binary'
mv kubectl-linux-v1.23.10+vmware.1 /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl


# Install Carvel tools
cd /tmp/cli

# Install yq
gunzip ytt-linux-amd64-v0.41.1+vmware.1.gz
chmod ugo+x ytt-linux-amd64-v0.41.1+vmware.1
mv ./ytt-linux-amd64-v0.41.1+vmware.1 /usr/local/bin/ytt

# install kapp
gunzip kapp-linux-amd64-v0.49.0+vmware.1.gz
chmod ugo+x kapp-linux-amd64-v0.49.0+vmware.1
mv ./kapp-linux-amd64-v0.49.0+vmware.1 /usr/local/bin/kapp

# install kbld
gunzip kbld-linux-amd64-v0.34.0+vmware.1.gz
chmod ugo+x kbld-linux-amd64-v0.34.0+vmware.1
mv ./kbld-linux-amd64-v0.34.0+vmware.1 /usr/local/bin/kbld

# Install imgpkg
gunzip imgpkg-linux-amd64-v0.29.0+vmware.1.gz
chmod ugo+x imgpkg-linux-amd64-v0.29.0+vmware.1
mv ./imgpkg-linux-amd64-v0.29.0+vmware.1 /usr/local/bin/imgpkg

echo '> debian-vmware.sh is Done'
