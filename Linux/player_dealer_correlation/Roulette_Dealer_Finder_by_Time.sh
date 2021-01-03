#!bin/bash
cat $1_* 
| grep -i -e "$2" | awk -F" " '{print $1,$2,$4,$5,$6}' >> $1_$2_dealer_report.txt

