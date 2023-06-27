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

### Use with a remote Mac

You can use this playbook to manage other Macs as well; the playbook doesn't even need to be run from a Mac at all! If you want to manage a remote Mac, either another Mac on your network, or a hosted Mac like the ones from [MacStadium](https://www.macstadium.com), you just need to make sure you can connect to it with SSH:

  1. (On the Mac you want to connect to:) Go to System Preferences > Sharing.
  2. Enable 'Remote Login'.

> You can also enable remote login on the command line:
>
>     sudo systemsetup -setremotelogin on

Then edit the `inventory` file in this repository and change the line that starts with `127.0.0.1` to:

```
[ip address or hostname of mac]  ansible_user=[mac ssh username]
```

If you need to supply an SSH password (if you don't use SSH keys), make sure to pass the `--ask-pass` parameter to the `ansible-playbook` command.


## Running the playbook 

 ```
 ansible-playbook -i inventory run.yml
 ```

