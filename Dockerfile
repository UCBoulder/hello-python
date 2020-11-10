FROM cuartifacts-platform-engineering-docker-local.jfrog.io/ubi8-min-python:8.3-201 as base

COPY ["Pipfile", "Pipfile.lock", "./"]
RUN pipenv install --deploy


# Install dev-deps and run tests
FROM base as test

RUN pipenv install --dev --deploy

COPY . .
RUN pipenv run pylint hello
RUN pipenv run pylint --disable=missing-docstring tests
RUN pipenv run pytest


# Throw away dev-deps and any testing artifacts for final image
FROM base

COPY . .
CMD ["pipenv", "run", "python", "./entrypoint.py"]
