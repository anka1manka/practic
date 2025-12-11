# auth_handler.py
import datetime
from database import check_user_in_database

def handle_auth(email, password):

    if not email or not password:
        return '''
        <!DOCTYPE html>
        <html>
        <body style="margin: 40px;">
            <h1 style="color: red;">Ошибка</h1>
            <p>Заполните все поля.</p>
            <p><a href="/login">Назад</a></p>
        </body>
        </html>
        '''
    
    user_exists, user_data = check_user_in_database(email, password)
    
    if user_exists:
        return f'''
        <!DOCTYPE html>
        <html>
        <body style="margin: 40px;">
            <h1 style="color: green;">Успешно</h1>
            <p>Имя: {user_data['name']} {user_data['surname']}</p>
            <p>Email: {email}</p>
            <p><a href="/">На главную</a></p>
        </body>
        </html>
        '''
    else:
        return f'''
        <!DOCTYPE html>
        <html>
        <body style="margin: 40px;">
            <h1 style="color: red;">Ошибка</h1>
            <p>Пользователь {email} не найден.</p>
            <p><a href="/login">Назад</a></p>
        </body>
        </html>
        '''