collections:
	ansible-galaxy install -r requirements.yaml

single: collections
	ansible-playbook k3s_single.yaml

etcd: collections
	ansible-playbook k3s_etcd.yaml

config:
	./kconfig.sh

list:
	lxc list

.PHONY: clean

clean:
	ansible-playbook k3s_delete_single.yaml
	ansible-playbook k3s_delete_etcd.yaml
