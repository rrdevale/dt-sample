# dt-sample
Automated daemontools installation with simple service configuration using Ansible

#NOTE: Replace the "<service_name>" in daemon.yml with the name you want to create the service 
Also check the source and destination details from the daemon.yml script as per your need before running the ansible playbook

#Command to be exexuted for configuration
ansible-playbook -i hosts.ini daemon.yml
