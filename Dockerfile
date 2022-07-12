FROM python:latest

ENV PYTHONUNBUFFERED 1
RUN mkdir /app

RUN python -m pip install --upgrade pip

WORKDIR /app

COPY . /app/

RUN pip install -r requirements.txt