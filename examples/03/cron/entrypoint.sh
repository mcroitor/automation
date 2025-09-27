#!/bin/sh

create_log_file() {
    echo "Creating log file..."
    touch /var/log/cron.log
    chmod 666 /var/log/cron.log
    echo "Log file created at /var/log/cron.log"
}

monitor_logs() {
    echo "=== Monitoring cron logs ==="
    tail -f /var/log/cron.log
}

run_cron() {
    echo "=== Starting cron daemon ==="
    exec cron -f
}

# Save environment variables for cron
env > /etc/environment

# Create log file with proper permissions
create_log_file

# Start monitoring logs in the background
monitor_logs &

# Start cron service
run_cron
