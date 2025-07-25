FROM python:3.10-slim-buster

WORKDIR /app

COPY . /app

RUN uv add -r requirements.txt

CMD ["python3", "app.py"]