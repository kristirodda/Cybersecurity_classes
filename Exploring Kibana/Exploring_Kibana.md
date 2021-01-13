## Activity File: Exploring Kibana

* You are a DevOps professional and have set up monitoring for one of your web servers. You are collecting all sorts of web log data and it is your job to review the data regularly to make sure everything is running smoothly. 

* Today, you notice something strange in the logs and you want to take a closer look.

* Your task: Explore the web server logs to see if there's anything unusual. Specifically, you will:

---

### Sample Data Loaded

# The following question and answers are examples of how I was able to use Kibana. 

    - In the last 7 days, how many unique visitors were located in India?
          
          In the last 7 days there were 215 unique visitors from India._
          {https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/UniqueVisitors_IN.png}


    - In the last 24 hours, of the visitors from China, how many were using Mac OSX?

          _In the last 7 days there were a total of 265 unique visitors from China. Of those 73 were using Mac OSX._
               {https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/UniqueVisitors_CN.png}


    - In the last 2 days, what percentage of visitors received 404 errors? How about 503 errors?
        
        
          _In the last 2 days there were 330 unique visitors. Of those 18 received the 404 response message, which is only 5.45%._
          _In the last 2 days only 4 of the 330 visitors received the 503 response, which is only 1.2%_
               {404: https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/404_response.png}
               {503: https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/503_response.png}


    - In the last 7 days, what country produced the majority of the traffic on the website?
          
          
          _After analyzing the data from the last 7 days, it is apparent that China produced the most unique visitors to the site. Of the 784 unique visitors 263 of those were from China._ 
              {https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/UniqueVisitors_CN.png} 


    - Of the traffic that's coming from that country, what time of day had the highest amount of activity?


          _According to the heatlamp, the most hits came at the 15:00 hour with 32 hits. A close second was the 09:00 hour with a 31 hits._
               {https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Kibana_Logs/Heatlamp_per_Hour.png}


# Now that you have a feel for the data, let's dive a bit deeper. Look at the chart that shows Unique Visitors Vs. Average Bytes.


     - Locate the time frame in the last 7 days with the most amount of bytes.

     
          _After reviewing the chart that compares Unique Visitors vs. Avg Bytes, it appears that the timestamp (per 3-hours) was on Dec 31, 2020 at 03:00. There were 77 unique visitors that had over 11,000 bytes._
     
     
     - In your own words, is there anything that seems potentially strange about this activity?
     
     
          _What seems strange is how high the byte count is between 3a.m. and 6a.m. The other oddity to me, is that according to the heatlamp, there should have been more hits between 3p.m. and 4p.m. for this information to line up._


# Filtering the data by this event. 


     _In order to answer this question, I filtered my log search to the December 31, 2020 at 3:00a.m. timestamp as we did from the previous question. I looked through several logs which were suspicious and have chosen one to work with._
          
          - What is the timestamp for this event?
               _December 31, 2020. 03:50:23.301_
     
          - What kind of file was downloaded?
               _From this sample log data, it appears a request was made from a Facebook profile of Pedro Duque to search for an astronaut by the name of Valerie ByKovky. The request was successful._
     
     - From what country did this activity originate?
          _The country of origin is Portugal._ 
     
     - What HTTP response codes were encountered by this visitor?
          _The visitor received a response code of 200._

# Switching into the expanded view of this log stamp, several unique points of interest are available.

          _Source IP Address: 55.119.247.237_
          _geo.coordinates.lat 48.36694167 and geo.coordinates.lon -107.9193444_
          _Windows XP was the OS of the source machine._
          _The full URL accessed was https://elastic-elastic-elastic.org/people/type:astronauts/name:valery-bykovsky/profile_ 
          _As previously stated, the visitor's traffic originated from Facebook. http://facebook.com/success/pedro-duque_


# After finishing this investigation here is a short overview of my insights. 

     - What do you think the user was doing?
               _I think the user was looking up information about Valerie ByKovky._
     
     
     - Was the file they downloaded malicious? If not, what is the file used for?
          _It does not appear that any file was downloaded._
     
     - Is there anything that seems suspicious about this activity?
          _Unless the visitor is using this information for malicious reasons, no. It has the potential to be malicious, but is not necessarily so._
     
     - Is any of the traffic you inspected potentially outside of compliance guidelines?
          _I do not know what compliance guidelines have been set up to know whether or not any compliance guidelines were broken. However, it does strike as odd that the visitor would have been using Facebook at work to search for people. So, yes, I believe this would violate compliance._