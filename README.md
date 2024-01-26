# Linux Administration

This repository contains Ansible playbooks and Docker files for managing my development environments. Tested on Ubuntu 22.04 LTS.

## Directory Structure

- `ansible/`: This directory contains all the Ansible playbooks and related files.
  - `files/`: This directory contains files that are used by the Ansible playbooks.
    - `docker/`: This directory contains Docker files for building specific images.
      - `freeplane-builder/`: Docker files for building a Freeplane image.
  - `playbooks/`: This directory contains all the Ansible playbooks.
    - `install_docker.yml`: Playbook for installing Docker.
    - `install_dotfiles.yml`: Playbook for installing dotfiles.
    - `install_essential_tools.yml`: Playbook for installing essential tools.
    - `install_github_ssh_keys.yml`: Playbook for installing GitHub SSH keys.
    - `install_vscode.yml`: Playbook for installing Visual Studio Code.
    - `main.yml`: The main playbook that includes all other playbooks.

## Prerequisites

To utilize these playbooks, ensure you have Ansible installed on your system. Follow these steps:

1. Install Ansible and SSH Pass by running the following command:

```bash
sudo apt install ansible sshpass
```

2. Create a hosts file to specify your target machine's details. Replace the placeholders with your actual values:

```
[dev-pc]
dev-pc-1 ansible_host=<ip_address> ansible_user=<username>
```

This will allow Ansible to identify and connect to your target machine.

## Usage

You can run a playbook with the following command:

```sh
ansible-playbook -i hosts ansible/playbooks/<playbook_name>.yml --ask-pass --ask-become-pass -vv