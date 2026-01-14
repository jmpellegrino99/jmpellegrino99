#!/bin/bash

# Prompt the user for input
read -p "Enter the maximum depth (x): " x
read -p "Enter the file type (y): " y
read -p "Enter the file name (z): " z

# Use the find command with user input
find . -maxdepth "$x" -type "$y" -name "$z"
