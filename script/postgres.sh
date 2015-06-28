#!/usr/bin/env bash

sudo apt-get install -y postgresql-9.3
sudo apt-get install -y libpq-dev

# Set up Postgres
TEMP_FILE=.postgres.sql
cat <<'EOF' > $TEMP_FILE
CREATE USER vagrant WITH PASSWORD 'vagrant';
CREATE DATABASE vagrant;
GRANT ALL PRIVILEGES ON DATABASE vagrant TO vagrant;
\q
EOF
sudo -u postgres psql -f $TEMP_FILE
rm $TEMP_FILE
