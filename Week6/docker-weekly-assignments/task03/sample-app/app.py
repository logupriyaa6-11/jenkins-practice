from flask import Flask
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get("DB_HOST"),
        database=os.environ.get("DB_NAME"),
        user=os.environ.get("DB_USER"),
        password=os.environ.get("DB_PASSWORD")
    )
    return conn

@app.route("/")
def home():
    conn = get_db_connection()
    cur = conn.cursor()
    
    cur.execute("CREATE TABLE IF NOT EXISTS visitors (id SERIAL PRIMARY KEY, name VARCHAR(50));")
    cur.execute("INSERT INTO visitors (name) VALUES ('User');")
    conn.commit()
    
    cur.execute("SELECT COUNT(*) FROM visitors;")
    count = cur.fetchone()[0]
    
    cur.close()
    conn.close()

    return f"Hello! Visitor count: {count}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
