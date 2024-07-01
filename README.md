# Lauch-Pad

Personal scripts for setup, load dotfiles and automate configuration for new environments.

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

Use docker to test the automation script

- Build image

```bash
chmod +x ./build-containers && ./build-containers
```

- Create and run container

```bash
docker run --rm -it new-computer bash
```
