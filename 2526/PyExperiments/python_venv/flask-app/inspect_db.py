import sqlite3

# Full path to your actual database
db_path = "/home/devasc/Documents/InfraCloud/InfraCloud2526/2526/PyExperiments/python_venv/flask-app/user.db"

conn = sqlite3.connect(db_path)
c = conn.cursor()

# Check which tables exist
c.execute("SELECT name FROM sqlite_master WHERE type='table';")
print("Tables in DB:", c.fetchall())

# Query USER_PLAIN
try:
    c.execute("SELECT * FROM USER_PLAIN;")
    rows = c.fetchall()
    print(rows)
except sqlite3.OperationalError as e:
    print("Error:", e)

conn.close()
