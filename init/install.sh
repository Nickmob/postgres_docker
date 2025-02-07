#!/bin/bash

cd /docker-entrypoint-initdb.d
rm -rf data
tar -xzvf aw.tar.gz -C .

export PGUSER=postgres
psql <<- SHELL
  CREATE USER docker;
  CREATE DATABASE "Adventureworks";
  GRANT ALL PRIVILEGES ON DATABASE "Adventureworks" TO docker;
SHELL
cd data
psql -d Adventureworks < install.sql
