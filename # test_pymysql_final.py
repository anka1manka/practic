import pymysql
from pymysql import Error

def get_users_with_roles():
    
    try:
        conn = pymysql.connect(
            host='127.0.0.1',
            port=3306,
            user='root',
            password='vikylya12345',
            database='pracic',
            charset='utf8mb4',
            cursorclass=pymysql.cursors.DictCursor
        )
        
        with conn.cursor() as cursor:
            query = """
            SELECT 
                u.id_user,
                u.name,
                u.surname,
                u.email,
                u.phone,
                u.date_registration,
                u.last_visit,
                u.is_active,
                GROUP_CONCAT(DISTINCT r.role_name ORDER BY r.role_name SEPARATOR ', ') AS roles,
                GROUP_CONCAT(DISTINCT p.permission_name ORDER BY p.permission_name SEPARATOR ', ') AS permissions
            FROM user u
            LEFT JOIN role_has_user rhu ON u.id_user = rhu.user_id_user
            LEFT JOIN role r ON rhu.role_id_role = r.id_role
            LEFT JOIN role_has_permission rhp ON r.id_role = rhp.role_id_role
            LEFT JOIN permission p ON rhp.permission_id_permission = p.id_permission
            GROUP BY u.id_user
            ORDER BY u.surname, u.name
            """
            
            cursor.execute(query)
            users = cursor.fetchall()
            
            if users:
                print("=" * 100)
                print(f"{'ID':<4} {'ФИО':<25} {'Email':<30} {'Телефон':<15} {'Роли':<30} {'Права'}")
                print("=" * 100)
                
                for user in users:
                    full_name = f"{user['surname']} {user['name']}"
                    active_status = '✓' if user['is_active'] else '✗'
                    id_display = f"{user['id_user']}{active_status}"
                    
                    print(f"{id_display:<4} {full_name:<25} {user['email']:<30} {user['phone']:<15} "
                          f"{user['roles'] if user['roles'] else '-':<30} {user['permissions'] if user['permissions'] else '-'}")
                
                print("=" * 100)
                print(f"Всего пользователей: {len(users)}")
            else:
                print("Пользователи не найдены")
        
        conn.close()
        
    except Error:
        pass  # Без вывода ошибок

if __name__ == "__main__":
    get_users_with_roles()