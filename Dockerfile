FROM python:3.8

WORKDIR /app

COPY ./requirements.txt /app
RUN python3 -m venv venv
RUN pip3 install -r ./requirements.txt
RUN pip3 install --root-user-action=ignore -r ./requirements.txt

COPY . /app

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "--timeout", "60000", "app:app"]

