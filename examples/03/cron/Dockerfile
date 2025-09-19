FROM ubuntu:latest

# Install cron
RUN apt-get update \
    && apt-get install -y cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy scripts and set permissions
COPY entrypoint.sh /entrypoint.sh
COPY entrypoint-simple.sh /entrypoint-simple.sh
COPY hello.sh /hello.sh
COPY test-cron.sh /test-cron.sh
RUN chmod +x /entrypoint.sh /entrypoint-simple.sh /hello.sh /test-cron.sh

# Add crontab file and configure cron
COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob \
    && crontab /etc/cron.d/cronjob \
    && touch /var/log/cron.log

# Run the command on container startup
CMD ["/entrypoint.sh"]
