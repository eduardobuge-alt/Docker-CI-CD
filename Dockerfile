FROM python:3.9-slim

RUN pip install flask

COPY . /app

WORKDIR /app

EXPOSE 8888

CMD ["python", "sample_app.py"]
