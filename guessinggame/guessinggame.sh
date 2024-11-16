#!/usr/bin/env bash

function count_files {
    local num_files=$(ls -1 | wc -l)
    echo $num_files
}

correct_answer=$(count_files)

function guess_game {
    while true; do
        echo "How many files are in the current directory?"
        read user_guess

        if ! [[ "$user_guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi

        if (( user_guess < correct_answer )); then
            echo "Your guess is too low."
        elif (( user_guess > correct_answer )); then
            echo "Your guess is too high."
        else
            echo "Congratulations! You guessed it right."
            break
        fi
    done
}

guess_game
