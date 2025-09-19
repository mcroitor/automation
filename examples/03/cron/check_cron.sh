#!/bin/bash

# Скрипт для проверки работы cron в контейнере
# Использование: ./check_cron.sh <container_name_or_id>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <container_name_or_id>"
    exit 1
fi

CONTAINER=$1

echo "=== Checking cron in container: $CONTAINER ==="
echo

echo "1. Container status:"
docker ps | grep $CONTAINER
echo

echo "2. Cron processes:"
docker exec $CONTAINER ps aux | grep -E "(cron|PID)"
echo

echo "3. Cron service status:"
docker exec $CONTAINER service cron status 2>/dev/null || echo "Service command not available"
echo

echo "4. Active crontab:"
docker exec $CONTAINER crontab -l 2>/dev/null || echo "No user crontab"
echo

echo "5. System cron jobs:"
docker exec $CONTAINER ls -la /etc/cron.d/ 2>/dev/null || echo "No system cron jobs"
echo

echo "6. Cron logs (last 10 lines):"
docker exec $CONTAINER tail -10 /var/log/cron.log 2>/dev/null || echo "No cron logs found"
echo

echo "7. Container logs (last 10 lines):"
docker logs --tail 10 $CONTAINER
echo

echo "=== Check completed ==="