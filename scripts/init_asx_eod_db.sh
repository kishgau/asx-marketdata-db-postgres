#!/bin/bash

DATABASE_NAME=asx_eod
DB_DUMP_LOCATION=/tmp/pgsql_data/asx_eod_out.sql

echo "*** CREATING DATABASE ***"

# create default database
#gosu postgres psql --dbname asx_eod <<EOSQL
#  CREATE DATABASE "$DATABASE_NAME";
#  GRANT ALL PRIVILEGES ON DATABASE "$DATABASE_NAME" TO postgres;
#EOSQL

set -e

# Perform all actions as user 'postgres'
export PGUSER=postgres

# Create the 'template_postgis' template db
psql <<EOSQL
CREATE DATABASE asx_eod TEMPLATE template1;
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'asx_eod';
EOSQL

# Populate 'template_postgis'
cd /tmp/pgsql_data
psql --dbname asx_eod  < /tmp/pgsql_data/asx_eod_out.sql

echo "*** DATABASE CREATED! ***"
