FROM cuartifacts-platform-engineering-docker-local.jfrog.io/ubi8-min-python:8.2-301 as base

COPY ["Pipfile", "Pipfile.lock", "./"]
# Install deps in existing virtualenv -- don't create nested venv nightmare
RUN pipenv install --deploy


# Install dev-deps and run tests
FROM base as test

RUN pipenv install --dev --deploy

COPY . .
RUN pylint hello
RUN pylint --disable=missing-docstring tests
RUN pytest


# Throw away dev-deps and any testing artifacts for final image
FROM base

COPY . .
CMD ["python", "./entrypoint.py"]
