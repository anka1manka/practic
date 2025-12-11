# main.py
from flask import Flask, render_template, request
from auth_routes import print_to_console
from auth_handler import handle_auth

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <!DOCTYPE html>
    <html>
    <body style="margin: 40px;">
        <h1>Сервер работает</h1>
        <p><a href="/login">Войти</a></p>
    </body>
    </html>
    '''

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/auth', methods=['POST'])
def auth():
    email, password = print_to_console(request)
    return handle_auth(email, password)

if __name__ == '__main__':
    print("Сервер запущен: http://localhost:5000")
    app.run(debug=True, port=5000)