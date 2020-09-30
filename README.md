# k3s on LXD

**Purpose of this Repository**

This is a proof of concept that k3s can be installed into **LXD/LXC** containers.
Personel use case are for,
1. Self-learning.
2. Education.
3. Training labs with resources constrains.

---

## Requirements on LXD Host

1. A single Ubuntu Focal 20.04 VM
    - 4GB Memory
    - 8 vCPU
    - 60GB HD
2. LXD 4.0.3 installed
3. Host kernel modules **overlay** and **br_netfilter** loaded.
4. Ansible installed
     ```bash
        $ ansible --version
        ansible 2.10.1
        config file = /home/<user>/Projects/k3s-on-lxd/ansible.cfg
        configured module search path = ['/home/<user>/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
        ansible python module location = /usr/lib/python3/dist-packages/ansible
        executable location = /usr/bin/ansible
        python version = 3.8.2 (default, Jul 16 2020, 14:00:26) [GCC 9.3.0]
5. I am using the latest version of **k3s**, currently at **v1.19.2+k3s1**, with default **containerd** runtime.
---

## Start playing

1. If you have limited resources but still want to experiement/learn **kubernetes**, **k3s** is a great option. You can deploy multi-nodes k3s cluster in a single VM.
2. First clone the repository ```$ git clone git@github.com:tsanghan/k3s-on-lxd.git```
3. Next ```cd k3s-on-lxd```
4. Initalize LXD with the seed file ***preseed.yaml***
5. And simpy type ```make single```
6. I have a ***Makefile*** to save you some typing.
7. ```make single``` will start a k3s cluster with 1x Primary and 2x Workers.
```make single``` will also do a ReplicaSet deployment at the end of the play.
8. ```make clean``` to tear down the cluster.
9. You can also type ```make etcd``` to create 3x Primary using etcd as datastore.
10. Enjoy.

---
## Improvement
1. Fix IP address for **lxc** instances
2. lxc instance base automation with **cloud-Init**
3. Add 2x LB for **api-services**.
4. Add multi worker nodes to **k3s-etcd** cluster.
4. Run k8s conformance test.
