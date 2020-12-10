from flask import *
from flask_cors import CORS
import controller.py

app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/search', methods=["POST"])
def get_query():
    query = request.get_json()

    search = controller.main()

    return json.dumps(search)


if __name__ == '__main__':
    app.run(port=8000)
