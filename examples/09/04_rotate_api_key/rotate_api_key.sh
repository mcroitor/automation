#!/bin/bash
# rotate_api_key.sh - пример ротации API ключа

set -euo pipefail

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a /var/log/secret_rotation.log
}

rotate_api_key() {
    local service_name="$1"
    
    log_message "Начинаем ротацию API ключа для сервиса: $service_name"
    
    # Получаем текущий ключ
    OLD_KEY=$(vault kv get -field=api_key "secret/$service_name")
    
    # Генерируем новый ключ через API сервиса
    NEW_KEY=$(curl -s -X POST "https://api.$service_name.com/keys" \
              -H "Authorization: Bearer $OLD_KEY" \
              | jq -r '.key')
    
    if [[ -z "$NEW_KEY" || "$NEW_KEY" == "null" ]]; then
        log_message "ОШИБКА: Не удалось сгенерировать новый ключ"
        return 1
    fi
    
    # Проверяем новый ключ
    if curl -s -f "https://api.$service_name.com/test" \
       -H "Authorization: Bearer $NEW_KEY" > /dev/null; then
        
        # Сохраняем новый ключ в Vault
        vault kv put "secret/$service_name" api_key="$NEW_KEY"
        
        # Деактивируем старый ключ
        curl -s -X DELETE "https://api.$service_name.com/keys/$OLD_KEY" \
             -H "Authorization: Bearer $NEW_KEY"
        
        log_message "Ротация ключа для $service_name завершена успешно"
        return 0
    else
        log_message "ОШИБКА: Новый ключ не прошел проверку"
        return 1
    fi
}

# Автоматизация через cron - ротация каждый месяц
# 0 2 1 * * /opt/scripts/rotate_api_key.sh
