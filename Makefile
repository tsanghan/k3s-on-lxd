collections:
	ansible-galaxy install -r requirements.yaml

single: collections
	ansible-playbook k3s_single.yaml

etcd: collections
	ansible-playbook k3s_etcd.yaml

kconfig:
	lxc file pull primary/etc/rancher/k3s/k3s.yaml ~/.kube/config
	sed -i "s/127.0.0.1/$$(lxc list | grep -A3 primary| grep eth0 | awk '{print $$4}')/" /home/localadmin/.kube/config

.PHONY: clean

clean:
	ansible-playbook k3s_delete_single.yaml
	ansible-playbook k3s_delete_etcd.yaml
