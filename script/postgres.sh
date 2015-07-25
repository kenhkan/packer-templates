#!/usr/bin/env bash

# Update repositories
sudo apt-get update

# Install PostgreSQL as well as the library
sudo apt-get install -y postgresql-9.3
sudo apt-get install -y libpq-dev

# Set up Postgres
TEMP_FILE=.postgres.sql
cat <<'EOF' > $TEMP_FILE
CREATE USER vagrant WITH PASSWORD 'vagrant';
CREATE DATABASE vagrant;
\connect vagrant
ALTER SCHEMA public OWNER TO vagrant;
ALTER DATABASE vagrant OWNER TO vagrant;
\q
EOF
sudo -u postgres psql -f $TEMP_FILE
rm $TEMP_FILE
