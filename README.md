# Ecolibrium_Energy_task
Steps:
1. Two ec2 instance is created 
  a. Ansible-Server 
  b. Node -1 -Web server
2. Created ansadmin user on both the servers. provide root privileges to ansadmin an all servers. Create Passwordless ssh Connection between them.
3. Install Ansible on Ansible server instance
   - create playbook to setup apache server and deploy index.html page on managenode 
   - Playbook path is /etc/ansible/server-setup.yml
   - add manage node host entry into hosts file
   - check ping using ping module
 4. Create checker.sh scrip to check web server is up and returning 200 status code. if httpd serice is down then scrip will start httpd service and make server up.
  - checker scrip  path is /home/ec2-user/checker.sh
  -to run checker script for every minute, we have added entry into crontab 
  - crontab entry * * * * * /home/ec2-user/checker.sh > /home/ec2-user/web.log - this will run scrip for every minute
  
