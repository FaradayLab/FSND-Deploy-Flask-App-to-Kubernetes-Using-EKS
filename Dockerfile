# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:stretch

COPY . /app
WORKDIR /app

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
# ENV PYTHONUNBUFFERED 1

# Install pip requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt


# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
# RUN useradd appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# CMD ["gunicorn", "--b", ":8080", "main:app"]
EXPOSE 8080
ENTRYPOINT [ "gunicorn", "--bind", ":8080", "main:APP" ]