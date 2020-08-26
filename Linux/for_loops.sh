#!/bin/bash
# by Daniel Alicie

# Create Variables
nums=$(seq 0 9)
states=('Nebraska' 'California' 'Texas' 'Hawaii' 'Washington')
ls_out=$(ls)
suids=$(find / -type f -perm /4000 2> /dev/null)

# Create For Loops
# Create a loop that adds 2 to each number and prints out the result
for num in ${nums[@]};
do
  new_num=$(($num + 2))
  echo $new_num
done

# Create a loop that looks for 'Hawaii'
for state in ${states[@]};
do
  if [ $state == 'Hawaii' ];
  then
    echo "Hawaii is the best!"
  else
    echo "I'm not a fan of Hawaii."
  fi
done

# Create a `for` loop that prints out each item in your variable that holds the output of the `ls` command.
for x in ${ls_out[@]};
do
  echo $x
done

# Bonus
# Create a for loop to print out suids on one line for each entry
for suid in ${suids[@]};
do
  echo $suid
done
