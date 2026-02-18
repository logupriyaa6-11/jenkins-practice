from flask import Flask, request
import mysql.connector
import os
import time

app = Flask(__name__)

while True:
    try:
        db = mysql.connector.connect(
            host=os.environ.get("DB_HOST"),
            user=os.environ.get("DB_USER"),
            password=os.environ.get("DB_PASSWORD"),
            database=os.environ.get("DB_NAME")
        )
        print("Connected to MySQL!")
        break
    except:
        print("Waiting for MySQL...")
        time.sleep(3)

cursor = db.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
)
""")
db.commit()

@app.route("/")
def home():
    return """
    <h2>Add User</h2>
    <form method="POST" action="/add">
        <input name="name" placeholder="Enter name" required />
        <button type="submit">Add</button>
    </form>
    """

@app.route("/add", methods=["POST"])
def add_user():
    name = request.form["name"]
    cursor.execute("INSERT INTO users (name) VALUES (%s)", (name,))
    db.commit()
    return f"User '{name}' added successfully!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)