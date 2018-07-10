#!/bin/bash

BASEPATH=/backups/db/data/infra
FILENAME=infra_`date +\%Y\%m\%d\%H\%M`

if [ ! -d "$BASEPATH" ]; then
  mkdir	-p $BASEPATH
fi

cd $BASEPATH

pg_dump --dbname=api_intinerarios --schema=public --file=$FILENAME.sql --username=intinerarios_user --host=10.4.40.2 --port=5432

zip $FILENAME.zip $FILENAME.sql

rm $FILENAME.sql

find $BASEPATH/* -mtime +30 -exec rm {} \;
