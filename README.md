## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible playbook file may be used to install only certain pieces of it, such as Filebeat.

{https://github.com/kristirodda/Cybersecurity_classes/blob/main/Ansible/ansible_playbook.yml}

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the Damn Vulnerable Web Application.

-Load balancing ensures that the application will be highly regulated, in addition to restricting http traffic access to the network. Load balancers ensures equal distribution of web traffic to the network.

-The primary advantage of using a Jump Box is that it provides a single point of entry for an entire network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the operating system and logs each event. 

  -_Filebeat is designed to record logs from computers that you set up such as log files, it also collects log events and outputs them into the ELK stack for easy reading._
  
  -_Metricbeat records statistics and metrics from the operating system and services which are running on the server. Much like Filebeat, Metricbeat will output data based on how you set it up and output through Elasticsearch or Logstash for easy reading._

The configuration details of each machine may be found below.

| Name          | Function            | IP Address     | Operating System |
|----------     |---------            |------------    |------------------|
| JumpBox       | Gateway             | 10.0.0.1       | Linux            |
| Red-Team-LB   | filter http traffic | 169.61.160.100 | Linux            |
| Web-1         | Redundancy          | 10.0.0.9       | Linux            |
| Web-2         | Redundancy          | 10.0.0.10      | Linux            |
| Web-3         | Redundnacy          | 10.0.0.11      | Linux            |
| ELK VM        | Output to Kibana    | 10.2.1.4       | Linux            |

### Access Policies
The machines on the internal network are not exposed to the public Internet. 

Only the **Jumpbox** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
  - _The only machine which accepts connection from the internet is the Jumpbox. Incoming rules are set up to allow a connection through only one local machine's IP address._

Machines within the network can only be accessed by _the Jumpbox_.
  _Each web-machine is desinged to ouput sys-logs to the ELK machine. None of these are accessible publicly. Inbound rules are established which allow connection only within the virtual network from the Jumpbox. Each Web-machine has access to the ELK VM through a mirrored connection set up through Azure._

  - _A summary of the access policies in place can be found in the table below._

| Name          | Publicly Accessible | White list 
|----------     |---------            |------------    
| Jump Box      | Yes                 | local machine ip 
| Web-1         | No                  |        
| Web-2         | No                  |   
| Web-3         | No                  |      


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
  - Any opportunity presented which can automate a task is valuable because it allows freedom from daily repetition of the same task. This not only improves productivity, but it also removes variables for mistakes based on repetitve action._

The playbook implements the following tasks:
The following bulletpoints will describe how to implement the elk-playbook

  -The “hosts” file must be updated to reflect the name of the network and the IP addresses which are allowed to access the ELK stack:_
>[webservers] 
>10.0.0.9 ansible_python_interpreter=/usr/bin/python3 
>10.0.0.10 ansible_python_interpreter=/usr/bin/python3 
>10.0.0.11 ansible_python_interpreter=/usr/bin/python3
>[elk] 
>10.2.1.4 ansible_python_interpreter=/usr/bin/python3 
      - _Once the "hosts" file is updated, the ELK playbook must be made to tellt he computer which programs to automatically start:_ 
      - _In order to install and run the ELK playbook, the follwing command must be run on command line <ansible-playbook elkplaybook.yml>. After the command is run, the display will show which have been started, changed and/or failed._
          [https://github.com/kristirodda/Cybersecurity_classes/blob/main/Images/Successful_playbook_install.png]
      _The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance._
          [https://github.com/kristirodda/Cybersecurity_classes/blob/main/Images/docker_ps.png]

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _The ELK server is set up to monitor the following machines:_
    _Web-1: IP: 10.0.0.9_
    _Web-2: IP: 10.0.0.10_
    _Web-3: IP: 10.0.0.11_
    
- _I was able to successfully install Filebeat as well as MetricBeat to my Elk stack._

These Beats allow us to collect the following information from each machine:
- _Filebeat is a collection of data on log events. This information is sent through Logstash which outputs to Kibana and gives the ability to read what is happening within our network._
- _Metricbeat is a shipper which will collect metric data from the operating system. It collects the stats and metrics to Logstash, or Elasticsearch, and the data can be read from the Kibana ouput._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- _Which file is the playbook? Where do you copy it?
    _Attached to this Readme is a copy of the ansible playbook. This should be copied into a file on your ansible docker to the following location /etc/ansible/<file>_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
    _The file which needs to be updated inside the ansible container is the hosts file. This must be updated (as seen at the beginning of this document) to reflect which private network IP addresses are allowed to host the ansible playbook.
    _It is important to ssh into any machine of which the playbook is designed to run. Then copy the file and run it on that machine. ELK and Filebeat are designed to work together. For instance, the Filebeat program is designed to take logs and output them into Kibana via the ELK vm. Which means that the Filebeat should be installed on the web-machines where files are being monitored. A mirrored connection needs to be establisted through Azure so that no ssh connection is required from Web-machines to the ELK stack. This protects the ELK machine from attack. 
- _Which URL do you navigate to in order to check that the ELK server is running?
    _In order to see if the ELK is running is this: http://<ELK_IP_52.--.--.--->:5601/app/kibana. If everything is working correctly, the Kibana page will appear. {https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/Kibana_homepage_Successful_ELK_Launch.png} ._

Specific commands the user will need to run to download the playbook, update the files, etc.

    -Command to check which ansible container is available: {sudo docker ps}
    -Command to start the docker: {sudo docker start <name_of_docker>}
    -Command to run the docker: {sudo docker attach <name_of_docker>}
    -Command to get to the correct folder: {cd /etc/ansible}
    -Command to add the new machine's private IP (please see the format at the beginning of this document): {nano hosts}
    -Command to write your playbook: {nano <name>playbook.yml}
    -Command to run the playbook once it has been saved: {ansible-playbook <name>playbook.yml}
