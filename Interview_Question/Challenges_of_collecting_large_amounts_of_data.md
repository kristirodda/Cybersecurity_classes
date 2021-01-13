What are the challenges of collecting huge amounts of data? How do security analysts deal with them?

    -In project 1, I dealt with looking at a lot of data through Kibana. 
    -Information investigated included analyzing the data through the dashboard, as well as reading logs and looking through the metric readings as well. 
        -Through this I worked my way through the dashboard and was able to filter for certain response types, as well as filter which country the hits were coming from and anaylze which timestamp had the most hits in bytes. 
        -Additionally, I was able to anaylze the log data and discover what types of requests were made, where it originated and where it was headed. (Please see https://github.com/kristirodda/Cybersecurity_classes/blob/main/Exploring%20Kibana/Exploring_Kibana.md for more information.)
    
Solution requirements and details: 
   
    -Understanding the Dashboard:
            -The dashboard allowed for easy data anaylis. The filter function allows for log filtering. It's very important to understand the different pieces of the query in order to maintain accurate results. But this tool is very valuable.  

                    *example: 
                        **Find how many visitors received the 404 message. 
                        **Filter for "response  is 404" which would output the needed information. 
            
            -The dashboard also allows for country filters. This allowed for easy assessment of the busiest, most heavy amounts of traffic based on country. 

            -Maps: the use of the maps function is helpful when analyzing the amount of bytes coming out of a country. 

            -Heatlamp: the heatlamp was super helpful to get a quick snapshot of which country was producing the most traffic. Once sorted by country, I was able to see exaclty what time of day the most traffic came out of a country. 

    -An analyst needs to know what they are looking for in order to assess large amounts of data. If the concept of filters and search functions is essential if large amounts of data are going to be kept in order. 

