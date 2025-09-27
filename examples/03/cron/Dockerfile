FROM ubuntu:latest

# Install cron
RUN apt-get update \
    && apt-get install -y cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy scripts and set permissions
COPY entrypoint.sh /entrypoint.sh
COPY hello.sh /hello.sh
RUN chmod +x /entrypoint.sh /hello.sh

# Add crontab file and configure cron
COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob \
    && crontab /etc/cron.d/cronjob

# Run the command on container startup
CMD ["/entrypoint.sh"]
