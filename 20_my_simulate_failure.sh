#!/usr/bin/env bash
set -euo pipefail
DB="appdb"
USER="root"
HOST="127.0.0.1"
PASS="1234"
mysql -h "$HOST" -u "$USER" -p"$PASS" -e "USE $DB; DROP TABLE IF EXISTS orders;"
echo "Simulated failure by dropping table 'orders' in $DB"
