#!/bin/bash

# Тестовый скрипт для проверки работы cron
echo "=== Cron Test Script ==="
echo "Execution time: $(date)"
echo "Script executed successfully!"

# Дополнительная информация для отладки
echo "PID: $$"
echo "User: $(whoami)"
echo "Working directory: $(pwd)"
echo "Environment variables:"
printenv | head -10
echo "=========================="