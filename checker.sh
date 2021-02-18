#!/bin/bash
# checking if the server is up and serving the expected content i.e returning a 200 status code. 
# if server service is down then started it agian

URL=http://3.22.241.169:80
response=$(curl --write-out '%{http_code}' --silent --output /dev/null $URL)

if [ $response -eq 200 ]
  then 
    echo "The web server is up and returning a 200 status code" 
  else
    echo "The web server is down!"
	if ssh -i "/home/ec2-user/info_ansible_key.pem" ec2-user@3.22.241.169 ps -aux | grep httpd; 
	  then
   	    echo "Apache service is running"
	else
    	  echo "Apache  service is not running..."
	  echo "Staring apache serice.."
	  ssh -i "/home/ec2-user/info_ansible_key.pem" ec2-user@3.22.241.169 sudo systemctl start httpd.service
	  echo "Apache service started..."
	fi

fi
