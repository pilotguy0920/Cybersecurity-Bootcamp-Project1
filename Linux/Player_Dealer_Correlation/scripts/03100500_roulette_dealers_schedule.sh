#!/bin/bash

#usage .roulette_dealers_schedule.sh (date) (time) (AM/PM)
cat 0310_Dealer_schedule | awk -F"\t" '{print $1, $3}' | grep "05:00:00 AM"  >> Dealers_working_during_losses


