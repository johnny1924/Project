from flask import Flask, request
from flask_restful import Api
from resources.res import *
from flask_cors import CORS

# import google_search

app = Flask(__name__, template_folder='templates')
api = Api(app, prefix='/api')
CORS(app)

api.add_resource(Home, '/')
api.add_resource(Check, '/chk')
api.add_resource(User, '/<usr>')


if __name__ == "__main__":
    app.run(debug=False, port=5001, host='0.0.0.0')