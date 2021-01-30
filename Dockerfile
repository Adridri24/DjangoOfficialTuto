FROM python:3.9-slim
# slim=debian-based. Not using alpine because it has poor python3 support.
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY requirements.txt /code/

RUN apt-get -qq update && apt-get -qq install -y libpq-dev gcc
# need gcc to compile psycopg2
RUN pip3 install -r requirements.txt
RUN apt-get -qq autoremove -y gcc

COPY . /code/