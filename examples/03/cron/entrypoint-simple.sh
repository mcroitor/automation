#!/bin/sh

echo "=== Starting Cron Container ==="
echo "Current time: $(date)"

# Ensure environment is available for cron
env | grep -v '^_' > /etc/environment

# Create and set permissions for log file
touch /var/log/cron.log
chmod 666 /var/log/cron.log

# Show cron configuration
echo "Cron jobs configured:"
cat /etc/cron.d/cronjob

# Function to monitor logs
monitor_logs() {
    echo "=== Monitoring cron logs ==="
    tail -f /var/log/cron.log
}

# Start log monitoring in background
monitor_logs &

# Start cron in foreground mode with output to stdout
echo "=== Starting cron daemon ==="
exec cron -f