import datetime
from database import check_user_in_database

def print_to_console(request):
    """Выводит данные авторизации в консоль"""
    email = request.form.get('email', '')
    password = request.form.get('password', '')
    
    print("=" * 50)
    print("ДАННЫЕ ИЗ ФОРМЫ АВТОРИЗАЦИИ:")
    print(f"Время: {datetime.datetime.now()}")
    print(f"Email: {email}")
    print(f"Пароль: {password}")
    
    user_exists, user_data = check_user_in_database(email, password)
    if user_exists:
        print(f"Статус: Пользователь найден")
    else:
        print("Статус: Пользователь НЕ найден")
    
    print("=" * 50)
    
    return email, password