import pymysql
from pymysql import Error

def check_user_in_database(email, password):
    try:
        connection = pymysql.connect(
            host='127.0.0.1',
            port=3306,
            user='root',
            password='vikylya12345',
            database='pracic',
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        
        with connection.cursor() as cursor:
            query = "SELECT * FROM user WHERE email = %s"
            cursor.execute(query, (email,))
            user = cursor.fetchone()
        
        connection.close()
        
        if user:
            if user['password'] == password:
                return True, user
            else:
                return False, None
        else:
            return False, None
            
    except Error as e:
        print(f"Ошибка БД: {e}")
        return False, None