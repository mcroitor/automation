#!/bin/bash

echo "$(date '+%Y-%m-%d %H:%M:%S'): Hello, World! From cron job"
echo "Current user: $(whoami)"
echo "Current directory: $(pwd)"
echo "Environment PATH: $PATH"
echo "---"