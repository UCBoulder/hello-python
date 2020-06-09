FROM ubi8/python-38 as base

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .


FROM base as test

RUN pip install --no-cache-dir -r requirements-dev.txt
RUN python -m unittest


FROM base

CMD ["python", "./entrypoint.py"]
