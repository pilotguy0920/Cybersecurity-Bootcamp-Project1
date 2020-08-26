#!/bin/bash

#usage .roulette_dealers_schedule.sh (date-0000) (time-00:00:00 AM/PM)
cat $1_Dealer_schedule | awk -F"\t" '{print $1, $3}' | grep -w "$2"  



