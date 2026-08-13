
from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    return "Sample App running con port 8888"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8888, threaded=False)
