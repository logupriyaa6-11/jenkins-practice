from flask import Flask, request
import mysql.connector
import os
import time

app = Flask(__name__)

def get_db_connection():
    while True:
        try:
            connection = mysql.connector.connect(
                host=os.environ.get("DB_HOST", "db"),
                user=os.environ.get("DB_USER", "root"),
                password=os.environ.get("DB_PASSWORD", "root"),
                database=os.environ.get("DB_NAME", "appdb"),
            )
            print("Connected to MySQL!")
            return connection
        except mysql.connector.Error as err:
            print(f"MySQL not ready yet: {err}")
            time.sleep(3)


# Initialize DB connection
db = get_db_connection()
cursor = db.cursor()

# Create table if not exists
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
    name = request.form.get("name")

    if not name:
        return "Name is required", 400

    try:
        cursor.execute("INSERT INTO users (name) VALUES (%s)", (name,))
        db.commit()
        return f"User '{name}' added successfully!"
    except mysql.connector.Error as err:
        return f"Database error: {err}", 500


if __name__ == "__main__":
    port = int(os.environ.get("APP_PORT", 5000))
    app.run(host="0.0.0.0", port=port)