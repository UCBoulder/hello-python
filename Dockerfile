FROM ubi8/python-38 as base

RUN pip install pipenv

WORKDIR /usr/src/app

COPY ["Pipfile", "Pipfile.lock", "./"]
# Install deps in existing virtualenv -- don't create nested venv nightmare
RUN pipenv install --deploy --system


# Install dev-deps and run tests
FROM base as test

RUN pipenv install --dev --deploy --system

COPY . .
RUN pylint hello
RUN pylint --disable=missing-docstring tests
RUN pytest


# Throw away dev-deps and any testing artifacts for final image
FROM base

COPY . .
CMD ["python", "./entrypoint.py"]
