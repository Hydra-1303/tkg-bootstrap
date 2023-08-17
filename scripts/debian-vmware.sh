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
cd /tmp/ && curl http://daltools.aanetworks.org/tanzu/tanzu-cli-bundle-linux-amd64.tar
tar -xvf tanzu-cli-bundle-linux-amd64.tar
cd ./cli/
echo '> Installing tanzu cli binary'
sudo install core/v1.4.0/tanzu-core-linux_amd64 /usr/local/bin/tanzu
chmod +x /usr/local/bin/tanzu

## Install TKG CLI Plugins
echo '> Installing plugins'
tanzu plugin install --local all

## Install Kubectl CLI
echo '> Downloading kubectl binary'
cd /tmp && curl http://daltools.aanetworks.org/tanzu/kubectl-linux-v1.21.2+vmware.1.gz
gunzip kubectl-linux-v1.21.2+vmware.1.gz
echo '> Installing kubectl binary'
mv kubectl-linux-v1.21.2+vmware.1 /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# Instal Carvel tools
echo '> Installing Carvel tools'
cd /tmp/cli
gunzip ytt-linux-amd64-v0.34.0+vmware.1.gz
chmod ugo+x ytt-linux-amd64-v0.34.0+vmware.1 && mv ./ytt-linux-amd64-v0.34.0+vmware.1 /usr/local/bin/ytt

gunzip kapp-linux-amd64-v0.37.0+vmware.1.gz
chmod ugo+x kapp-linux-amd64-v0.37.0+vmware.1 && mv ./kapp-linux-amd64-v0.37.0+vmware.1 /usr/local/bin/kapp

gunzip kbld-linux-amd64-v0.30.0+vmware.1.gz
chmod ugo+x kbld-linux-amd64-v0.30.0+vmware.1 && mv ./kbld-linux-amd64-v0.30.0+vmware.1 /usr/local/bin/kbld

gunzip imgpkg-linux-amd64-v0.10.0+vmware.1.gz
chmod ugo+x imgpkg-linux-amd64-v0.10.0+vmware.1 && mv ./imgpkg-linux-amd64-v0.10.0+vmware.1 /usr/local/bin/imgpkg

# Install yq
echo '> Installing yq'
cd /tmp/ && curl https://github.com/mikefarah/yq/releases/download/v4.13.4/yq_linux_amd64.tar.gz
tar -xvf yq_linux_amd64.tar && mv yq_linux_amd64 /usr/local/bin/yq

echo '> debian-vmware.sh is Done'