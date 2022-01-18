#!/bin/bash
[ ! -d "${HOME}/.kube" ] && mkdir ~/.kube; ln -sf $(pwd)/config ~/.kube/config
lxc file pull primary/etc/rancher/k3s/k3s.yaml config
sed -i "s/127.0.0.1/$(lxc list | grep -A3 primary| grep eth0 | awk '{print $4}')/" config
