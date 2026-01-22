from flask import Flask, request, jsonify
from datetime import datetime
import socket

app = Flask(__name__)

@app.route("/api/health", methods=["GET"])
def health():
    return jsonify({"status": "ok"})

@app.route("/api/time", methods=["GET"])
def time():
    return jsonify({"time": datetime.now().isoformat()})

@app.route("/api/message", methods=["POST"])
def message():
    msg = request.form.get("message")
    return jsonify({"received": msg})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
