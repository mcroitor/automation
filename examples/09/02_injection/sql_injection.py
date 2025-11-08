
# ...
# Уязвимый код
user_input = input("Введите имя пользователя: ")
query = f"SELECT * FROM users WHERE name = '{user_input}'"

# Атакующий вводит: "admin'; DROP TABLE users; --"
# Результат: SELECT * FROM users WHERE name = 'admin'; DROP TABLE users; --'
# База данных выполнит удаление таблицы пользователей!