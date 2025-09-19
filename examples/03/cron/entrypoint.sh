#!/bin/sh

echo "Starting cron service..."

# Save environment variables for cron
env > /etc/environment

# Create log file with proper permissions
touch /var/log/cron.log
chmod 666 /var/log/cron.log

# Start cron service first
service cron start

# Show cron status
echo "Cron service status:"
service cron status

# Display current crontab
echo "Active crontab:"
crontab -l

# Start monitoring cron logs and output to stdout
echo "Monitoring cron logs..."
tail -f /var/log/cron.log &

# Keep container running and show live logs
exec cron -f -L /dev/stdout