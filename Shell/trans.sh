#!/bin/bash

while true; do
read -p "Enter the language code: " code
if [[ "$code" =~ ^[a-z]{2}$ ]]; then break
else echo "Invalid code. Enter a two-letter code."
fi
done

while true; do
read -p "Enter an English phrase: " phrase
trans -b en:"$code" "$phrase"
done
