FROM python:3.9-slim

RUN pip install --no-cache-dir --progress-bar off flask

COPY . /app

WORKDIR /app

EXPOSE 8888

CMD ["python", "sample_app.py"]
