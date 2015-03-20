__author__ = 'wei'

from flask import Flask, jsonify, render_template, request
import requests

app = Flask(__name__)
app.config["DEBUG"] = True

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        # check if log in successfully
        return render_template("homepage.html", data = str((username, password)))
    else:
        return render_template("login.html")

if __name__ == "__main__":
    app.run(host = "0.0.0.0")
