from flask import *
from flask_cors import CORS

# import food location py file

app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return render_template('index.html')


if __name__ == '__main__':
    app.run(port=8000)
