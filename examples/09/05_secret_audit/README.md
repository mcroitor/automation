# Secret Audit Example

Этот пример демонстрирует, как реализовать аудит операций с секретами при использовании HashiCorp Vault.

## Установка зависимостей

```bash
pip install hvac
```

## Настройка окружения

Установите переменные окружения для подключения к Vault:

```bash
export VAULT_URL="http://localhost:8200"
export VAULT_TOKEN="your-vault-token"
```

Для Windows:

```cmd
set VAULT_URL=http://localhost:8200
set VAULT_TOKEN=your-vault-token
```

## Запуск примера

```bash
python secrets_audit.py
```

## Функциональность

Пример включает:

1. **SecretAuditLogger** - класс для ведения журнала операций с секретами
2. **get_secret_with_audit()** - получение секрета с аудитом
3. **put_secret_with_audit()** - сохранение секрета с аудитом  
4. **delete_secret_with_audit()** - удаление секрета с аудитом

## Структура журнала аудита

Каждая запись в журнале содержит:

- `timestamp` - время операции
- `user` - пользователь, выполнивший операцию
- `secret_name` - имя секрета
- `action` - тип операции (read, write, delete)
- `success` - успешность операции
- `client_ip` - IP адрес клиента (опционально)

## Требования безопасности

- Vault токен должен храниться в переменной окружения, а не в коде
- Журналы аудита должны храниться в защищенном месте
- Доступ к журналам должен быть ограничен
- Регулярно ротируйте Vault токены
