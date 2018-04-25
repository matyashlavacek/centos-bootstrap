# Centos initial server setup

## SSH key pairs
This playbook expects two public keys to be present in user's `~/.ssh/` folder
`id_rsa.pub` and `ans.pub`
* The former is used as an ssh key for the account created with this script.
* The latter is used by the rest of ansible scripts.

### Generate the key pairs
```
ssh-keygen -t rsa -b 4096 -C "email@example.com"
```

## Ansible

### Setup hosts / inventories
You can work with inventories or just setup local `/etc/ansible/hosts` file, e.g.:
```
[local]
vagrant ansible_host=127.0.0.1 ansible_user=vagrant ansible_ssh_private_key_file=~/.vagrant.d/insecure_private_key
```

### List available hosts
```
ansible-playbook --list-hosts bootstrap.yml
```

### Choose just subset of hosts
```
ansible-playbook --limit local bootstrap.yml
```

### Provision vagrant
```
ansible-playbook \
  --diff \
  --verbose \
  --limit local \
  bootstrap.yml
```

### Provision Centos server

```
ansible-playbook \
  --user <username> \
  --ask-pass \
  --ask-become-pass \
  --diff \
  --verbose \
  --inventory <ip_address/inventory or use --limit> \
  bootstrap.yml
```

### Or with ssh key loaded
```
ansible-playbook \
  --user <username> \
  --ask-become-pass \
  --diff \
  --verbose \
  --limit <host_subset> \
  bootstrap.yml
```
