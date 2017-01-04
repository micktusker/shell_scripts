#!/bin/bash
# Given a table name (works also for views and materialized views), dump the contents to a tsv file with the same name
#  as the table with an added extension ".tsv". 
$(/usr/pgsql-9.6/bin/psql -d cd38 -U micktusker -h 127.0.0.1 -A -F $'\t' -X -t -c "SELECT * FROM $1" >"$1".tsv)
