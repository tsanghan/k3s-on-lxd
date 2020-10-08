single: collections
	ansible-playbook k3s_single.yaml
	touch single

SHELL=/bin/bash
.ONESHELL:

collections:
	ansible-galaxy install -r requirements.yaml

etcd: collections
	ansible-playbook k3s_etcd.yaml
	touch etcd

config:
	lxc file pull primary/etc/rancher/k3s/k3s.yaml config
	sed -i "s/127.0.0.1/$$(lxc list | grep -A3 primary| grep eth0 | awk '{print $$4}')/" config

list:
	lxc list

.PHONY: clean

clean:
	ansible-playbook k3s_delete_single.yaml
	ansible-playbook k3s_delete_etcd.yaml
	[ -f config ] && rm config
	[ -f single ] && rm single
	[ -f etcd ] && rm etcd
