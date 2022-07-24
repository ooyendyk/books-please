FROM postgres:12
COPY books-please.sql /docker-entrypoint-initdb.d/
