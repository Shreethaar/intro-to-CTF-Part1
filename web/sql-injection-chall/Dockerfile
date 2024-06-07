FROM python:3.9-slim

WORKDIR /app


COPY . /app
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN mkdir -p /downloads

COPY chall-4/ .

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 1337

CMD ["python", "app.py"]

