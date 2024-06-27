FROM python:3.12.4

WORKDIR /app

COPY . /app

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 80
EXPOSE 5000

CMD ["python3", "app.py"]
