
# ...
# Уязвимый код
# user_input = input("Введите имя пользователя: ")
# query = f"SELECT * FROM users WHERE name = '{user_input}'"

# Атакующий вводит: "admin'; DROP TABLE users; --"
# Результат: SELECT * FROM users WHERE name = 'admin'; DROP TABLE users; --'
# База данных выполнит удаление таблицы пользователей!
# Исправленный код с использованием параметризованных запросов


def get_user_by_name(db_connection, user_name):
    """Retrieve user information safely using parameterized queries"""
    cursor = db_connection.cursor()
    query = "SELECT * FROM users WHERE name = ?"
    cursor.execute(query, (user_name,))
    return cursor.fetchall()