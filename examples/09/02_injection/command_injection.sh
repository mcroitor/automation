## Уязвимый скрипт

##  read -p "Введите имя файла для проверки: " filename
##  ls -la $filename
##  # Атакующий вводит: "file.txt; rm -rf /" or "file.txt && rm -rf /"
##  # Результат: ls -la file.txt; rm -rf /
##  # Система выполнит удаление всех файлов!

## Безопасный скрипт
read -p "Введите имя файла для проверки: " filename
ls -la "$filename"