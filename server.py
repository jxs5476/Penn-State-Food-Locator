from flask import *
from flask_cors import CORS

# import food location py file

app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/search', methods=["POST"])
def get_query():
    query = request.get_json()

    print(query)

    return json.dumps(query)


if __name__ == '__main__':
    app.run(port=8000)
