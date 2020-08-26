#!/bin/bash

#usage .roulette_dealers_schedule.sh (date) (time) (AM/PM)
cat $1_Dealer_schedule | awk -F"\t" '{print $1, $3}' | grep $2 | grep $3 >> Dealers_working_during_losses


