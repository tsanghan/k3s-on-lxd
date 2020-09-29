collections:
	ansible-galaxy install -r requirements.yaml

profile:
	ansible-playbook k3s_profile.yaml

single: profile collections
	ansible-playbook k3s_cluster.yaml

stack: profile collections
	ansible-playbook k3s_cluster_stack.yaml

clean:
	ansible-playbook k3s_delete_stack.yaml
	ansible-playbook k3s_delete.yaml
