Steps taken to get Ansible to configure a dev box
=====

1. Get pyenv/pip working
2. pip install ansible
3. Make a `pupperbox.yml` playbook.
4. Futz around with getting ansible to ssh as root, not centos (specified in inventory file)
5. Uh... setting up Docker or ZSH require cloning random people's repos ala https://github.com/ballPointPenguin/ansible-develop ? Does ansible have any centralized place to get modules? These roles/tasks don't seem to accept parameters and are completely OS-dependent?
