# itluke's dotfiles

An [ansible](https://docs.ansible.com/) playbook for my dotfiles and programs. 

These are the base dotfiles that I start with when I set up a new environment and can be deployed remotely or locally with ansible.

## Setup

**Ansible**

Ansible must be installed on the control node to run. For help getting setup follow [the official docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

**Installing content**

Use the `ansible-galaxy` command to download roles from the Galaxy server.

Run `ansible-galaxy install requirements.yml` 

**Inventory**

Create all inventory files (`ini` or `yml`) in `inventory/` folder

**Vars**

Update vars or create a yml vars file for a specific host `host_vars/my_machines_hostname.yml` 

## Running the playbook 

 ```
 ansible-playbook -i inventory run.yml
 ```

