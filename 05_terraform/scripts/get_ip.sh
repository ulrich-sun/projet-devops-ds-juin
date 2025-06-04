#!/bin/bash
rm -rf ../04_ansible/host_vars/machine-1.yaml
echo ansible_host: $1 > ../04_ansible/host_vars/machine-1.yaml
