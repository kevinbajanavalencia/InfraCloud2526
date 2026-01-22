from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hi! Pv2 – Flask APP working"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5010, debug=True)
