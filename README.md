### Hydra Appliances - Tanzu bootstrap VM

Debian VM OVA to bootstrap a VMware Tanzu environment.

This appliance is based on https://github.com/tsugliani/packer-vsphere-debian-appliances

VM was build with steps found on -> https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.6/vmware-tanzu-kubernetes-grid-16/GUID-install-cli.html

### Requirements
To succesfully build this OVA you need the following:

 1 - You need to connect directly to one ESXi host, no vCenter.
 
 2 - The ESXi needs the option GuestIPHack set to 1

```bash
    esxcli system settings advanced set -o /Net/GuestIPHack -i 1
```

 3 - The machine were packer will run, needs OVFtool.

### Building
First you need to update values on bootstrap-builder.json file.

```bash
./build-bootstrap.sh
```

To build a VM OVA with all the Tanzu CLI and other tools.

### Running

After importing de OVA into an ESXi or vCenter, you need to login and generate an SSH key pair.


```bash 
ssh-keygen -t rsa -b 4096 -C "hydra@hydra1303.com"
```

Add the private key to the SSH agent running on your machine, and enter the password you created in the previous step.

```bash 
   ssh-add ~/.ssh/id_rsa
```

If this command fails, execute "eval $(ssh-agent)" and then rerun the command.


### Available OVF Properties for configuring the appliance:
This is de list of available options at import time.

```bash
hydra at hydratools in ~
❯ govc import.spec tkg-bootstrap-11.6.0.ova | jq
{
  "DiskProvisioning": "flat",
  "IPAllocationPolicy": "dhcpPolicy",
  "IPProtocol": "IPv4",
  "PropertyMapping": [
    {
      "Key": "guestinfo.hostname",
      "Value": ""
    },
    {
      "Key": "guestinfo.ipaddress",
      "Value": ""
    },
    {
      "Key": "guestinfo.netprefix",
      "Value": ""
    },
    {
      "Key": "guestinfo.gateway",
      "Value": ""
    },
    {
      "Key": "guestinfo.dns",
      "Value": ""
    },
    {
      "Key": "guestinfo.domain",
      "Value": ""
    },
    {
      "Key": "guestinfo.password",
      "Value": ""
    },
    {
      "Key": "guestinfo.sshkey",
      "Value": ""
    }
  ],
  "NetworkMapping": [
    {
      "Name": "VM Network",
      "Network": ""
    }
  ],
  "MarkAsTemplate": false,
  "PowerOn": false,
  "InjectOvfEnv": false,
  "WaitForIP": false,
  "Name": null
}
```
