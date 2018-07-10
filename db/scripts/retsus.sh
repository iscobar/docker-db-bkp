#!/bin/bash

BASEPATH=/backups/db/data/retsus
FILENAME=retsus_`date +\%Y\%m\%d\%H\%M`

if [ ! -d "$BASEPATH" ]; then
  mkdir -p $BASEPATH
fi

cd $BASEPATH

pg_dump --dbname=retsus_homologacao --schema=public --file=$FILENAME.sql --username=retsus_homologacao_user --host=10.4.40.2 --port=5432

zip $FILENAME.zip $FILENAME.sql

rm $FILENAME.sql

find $BASEPATH/* -mtime +30 -exec rm {} \;
