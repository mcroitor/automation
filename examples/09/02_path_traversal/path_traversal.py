# Уязвимо к path traversal
# Если filename = "../../etc/passwd"
# Получим доступ к файлу паролей системы
def read_user_file(filename):
    with open(f"/app/uploads/{filename}", 'r') as f:
        return f.read()