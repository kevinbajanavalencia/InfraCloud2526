from flask import Flask, request, render_template

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def form():
    naam = None
    bericht = None

    if request.method == "POST":
        naam = request.form.get("naam")
        bericht = request.form.get("bericht")

    return render_template(
        "form.html",
        naam=naam,
        bericht=bericht
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, debug=True)

