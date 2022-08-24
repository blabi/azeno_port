#!/bin/sh

if test "$POSTGRES_DB" = "django"
then
  echo "Waiting for postgres"

  while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    sleep 0.1
  done

  echo "PostgresQL started"

fi

python manage.py flush --no-input
python manage.py migrate

exec "$@"