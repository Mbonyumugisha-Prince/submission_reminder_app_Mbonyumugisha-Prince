#!/bin/bash

# Create directories
mkdir -p submission_reminder_app/app
mkdir -p submission_reminder_app/modules
mkdir -p submission_reminder_app/assets
mkdir -p submission_reminder_app/config

# Create files
touch submission_reminder_app/app/reminder.sh
touch submission_reminder_app/modules/functions.sh
touch submission_reminder_app/assets/submissions.txt
touch submission_reminder_app/config/config.env
touch submission_reminder_app/config/startup.sh

# Populate config.env with default configuration settings
echo "REMINDER_INTERVAL=60
STUDENT_SUBMISSIONS=../assets/submissions.txt" > submission_reminder_app/config/config.env

# Add sample data to submissions.txt
echo -e "John Doe, Assignment 1, 2024-10-05\nJane Smith, Assignment 2, 2024-10-06\nBetty Lee, Assignment 3, 2024-10-07\nMark Twain, Assignment 4, 2024-10-08\nLucy Clark, Assignment 5, 2024-10-09" >> submission_reminder_app/assets/submissions.txt

echo "Environment setup completed. Directory and files have been created."

