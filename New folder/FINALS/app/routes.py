from flask import request, jsonify
from flask_restful import Resource

class CheckResource(Resource):
    def post(self):
        data = request.get_json()
        name = data.get('name')
        results = {"Facebook": [], "LinkedIn": [], "Instagram": []}

        # Simulated search logic
        results["Facebook"].append(f"facebook.com/{name}")
        results["LinkedIn"].append(f"linkedin.com/in/{name}")
        results["Instagram"].append(f"instagram.com/{name}")


