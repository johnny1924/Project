import subprocess
from flask_restful import Resource
from flask import redirect, render_template, request, url_for
from bs4 import BeautifulSoup as bs
import requests
import ssl
import googlesearch


def validate_request(data, *required_keys):
    missing_keys = [key for key in required_keys if key not in data]
    if missing_keys:
        return missing_keys[0]
    return None


class Home(Resource):
    def get(self):
        return render_template("index.html")


class Check(Resource):
    def post(self):
        try:
            data = request.json
            if not isinstance(data, dict):
                return {"error": "Invalid request data format"}, 400
            
            missing_key = validate_request(data, "nm")
            if missing_key:
                return {"error": f"Missing key: {missing_key}"}, 400

            user = data["nm"]
            result = googlesearch.process_name(user)
            return {"result": result}
        except Exception as e:
            print(f"An error occurred: {e}")
            return {"error": "An error occurred while processing the request"}, 500

    def get(self):
        pass  # If you have no GET method implementation, it can remain unimplemented


class User(Resource):
    def get(self, usr):
        query = f"{usr} LinkedIn {usr} Facebook {usr} Instagram"
        process = subprocess.run(
            ['python3', 'google_search.py', query], capture_output=True, text=True
        )
        urls = process.stdout.splitlines()
        urls_html = ''.join(f"<p>{url}</p>" for url in urls)
        return f"<h1>{usr} Socials</h1>{urls_html}"


# Configure SSL context
ssl._create_default_https_context = ssl._create_stdlib_context
