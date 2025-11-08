import os
import os.path

def read_user_file(filename):
    # Удаляем опасные символы
    safe_filename = os.path.basename(filename)
    
    # Создаем полный путь и проверяем, что он в пределах uploads
    upload_dir = "/app/uploads"
    full_path = os.path.join(upload_dir, safe_filename)
    
    # Получаем канонический путь для защиты от символических ссылок
    real_path = os.path.realpath(full_path)
    
    if not real_path.startswith(os.path.realpath(upload_dir)):
        raise ValueError("Доступ запрещен: файл вне разрешенного каталога")
    
    with open(real_path, 'r') as f:
        return f.read()
