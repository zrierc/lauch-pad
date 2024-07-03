# Lauch-Pad

Personal scripts for setup, load dotfiles and automate configuration for new environments.

### TODO

- [ ] Integrate with my dotfiles
- [ ] Setup private config (ssh, git, pass-manager, vpn, etc)

## Pre-Requisite

- Ansible
- Docker

## Run

To run the automation script run the following command:


```bash
ansible-playbook local.yml
```

You can run the automation script for specify group tools/configurations using tags. For example:

```bash
ansible-playbook -t dotfiles local.yml
```

> The command above will start automation script to install required tools, deps and conf for dotfiles only.

## Test

### Validating Playbooks using Linter

https://ansible.readthedocs.io/projects/lint/

[learn more](https://docs.ansible.com/ansible/latest/community/other_tools_and_programs.html#validate-playbook-tools)

### Run Playbook in Check Mode

```bash
ansible-playbook --check local.yml
```

[learn more](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html#running-playbooks-in-check-mode)

### Use docker to test the automation script

- Build image

```bash
chmod +x ./build-containers && ./build-containers
```

- Create and run container

```bash
docker run --rm -it new-computer bash
```
