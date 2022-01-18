prep: collections profile

collections:
				ansible-galaxy install -r requirements.yaml

.profile:
				ansible-playbook k3s_profile.yaml
				touch .profile

single: collections .profile
				ansible-playbook k3s_single.yaml

etcd: collections .profile
				ansible-playbook k3s_etcd.yaml

clean:
				ansible-playbook k3s_delete_single.yaml
				ansible-playbook k3s_delete_etcd.yaml

