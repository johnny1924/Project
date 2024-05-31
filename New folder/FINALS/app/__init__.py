from flask import Flask
from flask_restful import Api
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    api = Api(app)
    CORS(app)

    with app.app_context():
        # Import routes
        from . import routes

        # Register resources
        api.add_resource(routes.CheckResource, '/check')

        return app
