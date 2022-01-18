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
        config file = /home/user/Projects/k3s-on-lxd/ansible.cfg
        configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
        ansible python module location = /home/user/.pyenv/versions/3.8.6/lib/python3.8/site-packages/ansible
        executable location = /home/user/.pyenv/versions/3.8.6/bin/ansible
        python version = 3.8.6 (default, Sep 30 2020, 16:07:55) [GCC 9.3.0]
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
8. ```make single``` will also deploy a ReplicaSet at the end of the play.
[![asciicast](https://asciinema.org/a/362608.svg)](https://asciinema.org/a/362608))
9. ```make clean``` to tear down the cluster.
10. You can also type ```make etcd``` to create 3x Primary using etcd as datastore.
[![asciicast](https://asciinema.org/a/362619.svg)](https://asciinema.org/a/362619)
11. Enjoy.

---
## Improvement
1. Fix IP addresses for **lxc** instances
2. lxc instance base automation with **cloud-Init**
3. Add 2x LB for **api-services**.
4. Add multi worker nodes to **k3s-etcd** cluster.
4. Run k8s conformance test.
