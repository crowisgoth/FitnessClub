from typing import Union
import psycopg2
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)
app.static_folder = 'static'
if __name__ == '__main__':
    app.run()







def getUser():
    return psycopg2.connect(

        dbname="fitness_club",
        user="admin",
        password="admin",
        host="localhost",
        port="32769"
    )


@app.route('/')
def index():
    return render_template('home.html')

@app.route('/<int:client_id>')
def get_client(client_id):

    try:
        conn = getUser()
        cur = conn.cursor()
        cur.execute(f'SELECT * FROM client_info WHERE client_id = {client_id}')
        client = cur.fetchall()
        conn.close()
        return render_template('client.html', client=client)


    except:
        print("error")
        conn = getUser()
        cur = conn.cursor()
        cur.execute(f'SELECT * FROM clients WHERE client_id = {client_id}')
        client = cur.fetchall()
        conn.close()
        return render_template('client_without_workout.html', client=client)






@app.route('/allclients')
def get_allclients():
    conn = getUser()
    cur = conn.cursor()
    cur.execute(f'SELECT * FROM clients')
    clients = cur.fetchall()
    conn.close()
    return render_template('allclients.html', clients=clients)

@app.route('/new', methods=['GET', 'POST'])
def new_post():

    if request.method == 'POST':

        # print(type(request.form['first_name']))
        first_name_execute = request.form.get('first_name')
        last_name_execute = request.form.get('last_name')
        conn = getUser()
        cur = conn.cursor()
        cur.execute(f"INSERT INTO clients (first_name,last_name) VALUES ('{first_name_execute}','{last_name_execute}')")
        print(cur.execute)
        conn.commit()
        conn.close()

        return redirect(url_for('get_allclients'))

    return render_template('add_client.html')
@app.route('/halls')
def all_halls():
    conn = getUser()
    cur = conn.cursor()
    cur.execute(f'SELECT * FROM halls')
    halls = cur.fetchall()
    conn.close()
    return render_template('halls.html', halls=halls)

@app.route('/currenthall/<int:hall_id>')
def current_hall(hall_id):
    conn = getUser()
    cur = conn.cursor()
    cur.execute(f'SELECT * FROM halls where hall_id = {hall_id}')
    halls = cur.fetchall()
    conn.close()
    return render_template('halls.html', halls=halls)

@app.route('/trainers')
def all_instructors():
    conn = getUser()
    cur = conn.cursor()
    cur.execute(f'SELECT * FROM instructors')
    instructors = cur.fetchall()
    conn.close()
    return render_template('trainers.html', instructors=instructors)

@app.route('/prices')
def show_prices():
    return render_template('prices.html')


