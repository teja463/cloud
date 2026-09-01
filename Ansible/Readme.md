# Ansible

> We are using the ubuntu `teja463/ubuntu-ssh` and rhel `teja463/rhel-ssh` containers as ansible nodes

## SSH

### Connecting

- `ssh machine-ip-address` to open ssh connection to the remote machine
- SSH assumes by default that the username on the server is same as your workstation
- If not add username@ip-address

### Using ssh

- `ssh-keygen -t ed25519 -C "Sample key"`. There are other key types like RSA, DSA etc byt ed22519 is widley used for security
- Enter passphrase if you like to make it more secure, but you need to type this passphrase whenever you try to use this ssh key
- `ssh-copy-id -i ~/.ssh/ansible.pub 172.168.0.2` to copy the public to the servers you want to connect to
- `ssh -i ~/.ssh/ansible 172.168.1.32` when you have multiple keys and if you want to use a specific key for the ssh connection
- `eval $(ssh-agent)` and type `ssh-add` if you don't want to type passphrase every time use the commands in this line

### Using docker to simulate nodes

```bash
docker pull teja463/ubuntu-ssh
docker run -it --name node1 teja463/ubuntu-ssh

docker pull teja463/rhel-ssh
docker run -it --name node2 teja463/rhel-ssh
```

> If you don't have ansible in local machine, you can use the ubuntu image as the master node  
> Install the ansible in the master node using `apt install ansible -y`

- type `ip a` to get the ipaddress of the docker nodes
- The source code for the image `teja463/ubuntu-ssh` is available at [Ubuntu Dockerfile](./Ubuntu.Dockerfile)
- The source code for the image `teja463/rhel-ssh` is available at [RHEL Dockerfile](./RHEL.Dockerfile)

### Ansible commands

- Create a file called `inventory` and keep all the ip addresses or the hostnames of the docker nodes
- `ansible all --key-file ~/.ssh/id_ed25519 -i inventory -m ping` This invokes ping module on all the hosts in the inventory using the key specified, `-i` is for location of inventory file
- `ansible.cfg` You can configure the defaults in this file and use the command `ansible all -m ping` and skip the config keys which is there int he `.cfg` file
- `ansible all --list-hosts` to view list of hosts
- `ansible all -m gather_facts` To get all info about the remote nodes
- `ansible all -m ping --limit 172.17.0.2` to limit the execution to one ip

### Running elevated ad-hoc commands

- `ansible all -m apt -a update_cache=true --become --ask-become-pass` Tell ansible to use sudo (become)
- `ansible all -m apt -a name=vim-nox --become --ask-become-pass` Install a package via the apt module
- `ansible all -m apt -a "name=snapd state=latest" --become --ask-become-pass` Install a package via the apt module, and also make sure it’s the latest version available
- `ansible all -m apt -a upgrade=dist --become --ask-become-passxx` Upgrade all the package updates that are available

### Ansible Playbooks

- Created first playbook `install-apache2-playbook.yml` to install the apache2
- To install run `ansible-playbook --ask-become-pass apache2-playbook.yml`

#### Conditional in playbooks

- You execute `ansible all -m gather_facts | grep ansible_distribution` command and read all properties of the gather facts
- Here we are using the **when** condition and the ansible_distribution property to target ubuntu and rhel nodes and installing specific packages in them

