from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/api/form", methods=["POST"])
def api_form():
    naam = request.form.get("naam")
    bericht = request.form.get("bericht")

    if not naam or not bericht:
        return jsonify({
            "status": "error",
            "message": "naam en bericht zijn verplicht"
        }), 400

    return jsonify({
        "status": "success",
        "ontvangen_data": {
            "naam": naam,
            "bericht": bericht
        }
    })

@app.route("/api/health", methods=["GET"])
def health():
    return jsonify({"status": "API is running"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002, debug=True)
