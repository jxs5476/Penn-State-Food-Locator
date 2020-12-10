from flask import *
from flask_cors import CORS
import Controller

app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/search', methods=["POST"])
def get_query():
    queryDict = request.get_json()
    print(queryDict)

    #results = Controller.get_user_search(queryDict)
    return queryDict#results


if __name__ == '__main__':
    app.run(port=8000)
