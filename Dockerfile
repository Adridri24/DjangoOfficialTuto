FROM python:3.9-alpine
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/

# Install individual dependencies
RUN apk add --update --no-cache postgresql-client postgresql-libs
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc musl-dev libc-dev linux-headers postgresql-dev

RUN pip install -r requirements.txt

# Remove dependencies
RUN apk del .tmp-build-deps

COPY . /code/