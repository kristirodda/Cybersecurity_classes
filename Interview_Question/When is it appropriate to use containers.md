When is it appropriate to use containers in cloud deployments, and what are the security benefits of doing so? 

    -In project 1, I used a container from within the Jumpbox VM. 
    
    -The container was used to create ansible playbooks and launch programs throughout my entire virtual network. This container was set up to house the ansible playbook, the ELK stack playbook as well as the Filebeat and Metricbeat playbooks. 

    Solution Requirements: 

        -This was an appropriate use of a container because it is able to keep cohesion within my machines. 
        -The security benefits from using containers is that there is literally only one access point to it. The only way to access the container is through the Jumpbox VM. 

    Solution Details: 

        -In this project, the way I configured my VMs to run the container is by adding their name and their IP address to the hosts file within the container. 
        -I was able to select and install the correct container on each machine by accessing only one container on the Jumpbox VM. Every playbook, and access into the virtual network assured the correct container was installed. 
        -I verified everything was running correctly by running the ansible playbook command <ansible-playbook playbook.yml>. A series of commands was launched and there were no errors recorded. 

            {https://github.com/kristirodda/Cybersecurity_classes/blob/main/Images/Successful_playbook_install.png}

    Advantages and Disadvantages

        -In order to achieve the same thing without a container, I would have had to run each program from each machine individually. 
        -After working on this project, I can't logically think of an advantage of doing this without a container. 
        -The disadvantage would be that each program would need to be run, one machine at a time. This would definitely take more time and with repetition, there is a greater chance of failure. 
