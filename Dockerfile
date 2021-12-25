FROM python:3.8.3-alpine
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

# dependencies for psycopg2-binary
RUN apk add --no-cache mariadb-connector-c-dev
RUN apk update && apk add python3 python3-dev mariadb-dev build-base && pip3 install mysqlclient

## dependencies for pillow
# RUN apk --update && apk add jpeg-dev zlib-dev
# RUN apk add --no-cache --virtual .build-deps build-base linux-headers


RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base linux-headers \
    && pip install Pillow

# By copying over requirements first, we make sure that Docker will cache
# our installed requirements rather than reinstall them on every build
RUN python3 -m pip install --upgrade pip setuptools wheel
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Now copy in our code, and run it
COPY . /app/
