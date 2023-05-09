FROM python:3.8

WORKDIR /app

COPY ./requirements.txt /app
RUN pip3 install -r ./requirements.txt

COPY . /app

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "--timeout", "60000", "app:app"]

