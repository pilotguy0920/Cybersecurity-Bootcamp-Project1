#!/bin/bash
# by Daniel Alicie
#Check if script was run as root. Exit if false.
if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
  exit
fi

# Define Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
suids=$(find / -type f -perm /4000 2> /dev/null)


# Check for research directory. Create it if needed.
if [ ! -d $HOME/research ]
then
 mkdir $HOME/research
fi

# Check for output file. Clear it if needed.
if [ -f $output ]
then
  rm $output
fi

echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output
echo -e "Hostname: $(hostname -s) \n" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo -e "\nMemory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
echo -e "\nSUID Files:" >> $output
echo $suids >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output
fi
