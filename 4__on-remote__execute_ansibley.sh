ssh-copy-id -i ~/.ssh/ansiblekey.pub 192.168.1.119
ansible-galaxy collection install kewlfft.aur
ansible-playbook --ask-become-pass create_aur_builder.yaml

ansible-playbook --ask-become-pass install_apps.yaml
