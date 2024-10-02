#!/bin/bash

# Source configuration and functions
source "$(dirname "$0")/config.env"
source "$(dirname "$0")/../modules/functions.sh"

# Function to display an interactive menu
function show_menu() {
    echo "Welcome to the Submission Reminder App"
    echo "Today is $(date '+%A, %B %d, %Y')."
    echo "Please select an option:"
    echo "1) Start reminder notifications"
    echo "2) Perform system health check"
    echo "3) Exit"
    read -p "Enter your choice: " choice
    return $choice
}

# Function to perform system health checks
function health_check() {
    echo "Performing system health checks..."
    # Example check: Ensure submissions.txt is accessible
    if [ ! -f "$(dirname "$0")/../assets/submissions.txt" ]; then
        echo "Error: Submissions record file not found."
        exit 1
    fi
    echo "All systems functional."
}

# Function to start the reminder process
function start_reminders() {
    echo "Starting reminder service..."
    while true; do
        # Call reminder.sh and wait for the next interval
        bash "$(dirname "$0")/../app/reminder.sh"
        sleep "$REMINDER_INTERVAL"
    done
}

# Main logic
while true; do
    show_menu
    choice=$?
    case $choice in
        1)
            # Start reminders in the background and allow exit or other commands
            start_reminders &
            echo "Reminder service started. Running in the background."
            ;;
        2)
            health_check
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done

# Trap signals for a graceful shutdown
trap 'echo "Shutting down..."; kill $!; exit' SIGINT SIGTERM

