## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[https://github.com/kristirodda/Cybersecurity_classes/tree/main/Diagram]

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly _____, in addition to restricting _____ to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the _____ and system _____.
- _TODO: What does Filebeat watch for?_
- _TODO: What does Metricbeat record?_

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name          | Function            | IP Address     | Operating System |
|----------     |---------            |------------    |------------------|
| Jump Box      | Gateway             | 10.0.0.1       | Linux            |
| Web-1         | Redundancy          | 10.0.0.9       | Linux            |
| Web-2         | Redundancy          | 10.0.0.10      | Linux            |
| Web-3         | Redundnacy          | 10.0.0.11      | Linux            |
| Red-Team-LB   | filter http traffic | 169.61.160.100 | Linux            |
| ELK VM        | Output to Kibana    | 10.2.1.4       | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the __Jumpbox___ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
  - _TODO: The only machine which accepts connection from the internet is the Jumpbox machine and it is allowed connection only through my local IP_

Machines within the network can only be accessed by _____.
  - _TODO: Because each of my Web machines is stirint system logs to the ELK virtual machine, they each have access to the ELK VM_

  - _A summary of the access policies in place can be found in the table below._

| Name          | Publicly Accessible | White list 
|----------     |---------            |------------    
| Jump Box      | Yes                 | local machine ip        
| Web-1         | No                  |        
| Web-2         | No                  |   
| Web-3         | No                  |      


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
  - _TODO: Any opportunity presented which can automate a task is valuable because it allows freedom from daily repetition of the same task. This will improve productivity as well as remove a variable for mistakes._

The playbook implements the following tasks:
- _TODO: The following bulletpoints will describe how to implement the elk-playbook_
      - _The “hosts” file must be updated to reflect the name of the network and the IP addresses which are allowed to access the ELK stack:_
              [webservers] 
              ## alpha.example.org 
              ## beta.example.org 
              ## 192.168.1.100
              ## 192.168.1.110 
              10.0.0.9 ansible_python_interpreter=/usr/bin/python3 
              10.0.0.10 ansible_python_interpreter=/usr/bin/python3 
              10.0.0.11 ansible_python_interpreter=/usr/bin/python3 
              [elk] 
              10.2.1.4 ansible_python_interpreter=/usr/bin/python3 
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

We have installed the following Beats on these machines:
- _I was able to successfully install Filebeat as well as MetricBeat on my Elk-vm_

These Beats allow us to collect the following information from each machine:
- _Filebeat is a collection of data on log events. This information is sent through Logstash which outputs to Kibana and gives the ability to read what is happening within our network._
- _Metricbeat is a shipper which will collect metric data from the operating system. It collects the stats and metrics to Logstash, or Elasticsearch, and the data can be read from the Kibana ouput._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
