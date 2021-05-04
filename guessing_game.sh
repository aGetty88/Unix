#!/bin/bash
# guessing_game.sh
# 4/19/21
# CIS-170

# this is a high-low guessing game

declare again="Y"

while [ $again = "Y" ]
do
    num=$((( $RANDOM%100)+1))
    guess=-1
    while [ $guess != $num ]
    do
        valid=0
        while (( valid==0 ))
        do
            echo "Welcome to the game of high-low guessing."
            read -p "Enter your guess from 1 to 100: " guess

            echo "$guess" | grep -a "^[0-9]\+$"

            if  [ $? -eq 0 ]
            then
                valid=1
            else
                echo "invalid input"
            fi
        done
    if [ $guess -gt $num ]
    then
        echo "Your guess is too high."
    elif [ $guess -lt $num ]
    then
        echo "Your guess is too low."
    else
    echo "Congratulations! You guessed the number."
    again="X"
    fi
    done
    while [ $again != "Y" ] && [ $again != "N" ]
    do
        read -p "Play again? (Y/N) " again
        again=$(echo $again | tr 'ny' 'NY')
        if [ $again != "Y" ] && [ $again != "N" ]
        then
            echo "invalid responce"
        fi
    done
    echo "Thanks for playing!"
done
exit 0
