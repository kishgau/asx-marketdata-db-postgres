#Dockerfile to set up a postgres db 
FROM postgres:latest

RUN mkdir -p /tmp/pgsql_data

COPY db/asx_eod_out.sql /tmp/pgsql_data 
COPY scripts/init_asx_eod_db.sh /docker-entrypoint-initdb.d/
