from flask import *
from flask_cors import CORS
from Controller import Controller

app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/search', methods=["POST"])
def get_query():
    queryDict = request.get_json()
    print(queryDict)
    controller = Controller()
    results = Controller.get_user_search(controller, queryDict)
    print("ha")
    return json.dumps(results)


if __name__ == '__main__':
    app.run(port=8000)
