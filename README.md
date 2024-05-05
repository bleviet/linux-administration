# Linux Administration

This repository contains Ansible playbooks and Docker files for managing my development environments. Tested on MXLinux 23.

## Prerequisites

To utilize these playbooks, ensure you have Ansible installed on your system. Follow these steps:

1. Install Ansible and SSH Pass by running the following command:

```bash
sudo apt install ansible sshpass
```

2. Create a hosts file to specify your target machines' details. Replace the placeholders with your actual values:

```
[dev-pc]
dev-pc-1 ansible_host=<ip_address> ansible_user=<username>
dev-pc-2 ansible_host=<ip_address> ansible_user=<username>
```

This will allow Ansible to identify and connect to your target machines.

## Usage

You can run a playbook with the following command:

```sh
ansible-playbook -i hosts ansible/playbooks/<playbook_name>.yml --ask-pass --ask-become-pass -vv
```

To execute an Ansible playbook on a specific host by name, you can specify the host or group name using the -l (or --limit) option when running the ansible-playbook command.

Here's how you can do it:

```sh
ansible-playbook -i hosts ansible/playbooks/<playbook_name>.yml --ask-pass --ask-become-pass -vv -l dev-pc-2
```

If you want to run it on multiple hosts, you can specify a comma-separated list of host names:
```sh
ansible-playbook -i hosts ansible/playbooks/<playbook_name>.yml --ask-pass --ask-become-pass -vv -l dev-pc-1,dev-pc-2
```

## Post installation

### Tmux
1. Start tmux
2. <C-a><S-i> for installing the plugins
