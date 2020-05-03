# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:stretch

COPY . /app
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1

RUN pip install --upgrade pip
RUN pip install -r requirements.txt


EXPOSE 8080
ENTRYPOINT [ "gunicorn", "--bind", ":8080", "main:APP" ]