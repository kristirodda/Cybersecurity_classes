Explanation of the firewalls

**Question 1: Faulty firewalls**

Suppose you have a firewall that is supposed to block SSH connections but instead lets them through. 
How would you debug it? 

Answer: 

    1. During this project, we were tasked to allow SSH connections between our personal machine into the Jumpbox VM. In addition, the Jumpbox VM needed to be able to SSH into each vm on our virtual network. In order to accomplish this, without allowing unwanted SSH connections, we establish incoming traffic rules. 

    2. * A concrete example of allowing my local machine SSH access to the Jumpbox was written through the following inbound traffic rule on the Virtual Network Security Group: 
            
            Source select: IP Address
            Source IP address: <local machine IP>
            Source port range: *
            Destination select: IP address
            Destination IP address: <Jumpbox vm IP>
            Destination port range: 22
            Protocol: Any
            Action: Allow
            Priority: 100
            Named: SSH

    * The Jumpbox VM was allowed an SSH connection to each of the following machines: Web-1, Web-2, and Web-3. 

    * If the SSH inbound rule was not set up to "allow" SSH connection, then each attempt was kicked back as "failed". In order to prevent unwanted SSH connections, an inbound rule was set up where the Action was set to "DENY". This prevented any SSH connection from any IP from being established. 

    3. If one of the VMs was accepting SSH connections, I would assume that a rule was not written that would DENY any SSH connection. 

    * The first configuration I would check would be the Network Security Inbound rules to verify if which rules were already in place. I would write a rule to "DENY" incoming TCP traffic from "ALL" sources. 

    * In order to test this to verify the rule worked, I would use my personal machine to attempt to SSH into one of the target machines. If the rule was written correctly, my connection would be denied. If for any reason the rule failed, I would revisit how I wrote the rule. 

    4. Specific panes of the Azure UI I would look at to investigate this issue include the following: 

        The Network Security Groups
            <Selected Network> 
                Settings
                    Inbound Security rules
    
    * The specific configurations I would check would be the ports and protocols. This would help me determine which ports are allowed access and through which protocol (ANY, TCP, UDP, ICMP). I would read the action column to see if the action was set to allow or deny. Finally, I would look at the source and the destination columns to ascertain if the desired IP address was protected. 

    * I would look specifically to make sure that the port (22) and protocol (TCP, or ANY) were set to the "DENY" action regarding the IP address I want to protect. 

    * Just like the other troubleshooting technique, I would utilize the command line of a local computer and attempt to SSH into the device I wanted to protect. 

    5. The advantage of setting up this type of firewall protection is that it would make accessing the protected machine more difficult for an attacker. Although it would not make this protected machine "immune" it would certainly create a tight enough wall that it would require more work to get into. 

    The disadvantage of this firewall configuration is that if it is set up incorrectly, then the machine's designed function might not be achieved. As learned, through a lot of trial and error when establishing these rules to protect the ELK machine. If even one portion of the firewall rule is written incorrectly, the whole thing fails. 

    * The first way to ensure security on my network is through the health probe set up. I would check the configurations of the load balancer to ensure an automatic fail for too many log in attempts. 



