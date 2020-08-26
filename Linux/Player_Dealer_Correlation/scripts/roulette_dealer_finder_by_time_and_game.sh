#!/bin/bash

#usage ./roulette_dealers_schedule.sh (date-0000) (game_played(2=Black Jack, 3=Roulette, 4=Texas Holdem) (time-"00:00:00 AM/PM")
cat $1_Dealer_schedule | awk -F"\t" '{print $1, $a}' a=$2 | grep "$3"
 
  



