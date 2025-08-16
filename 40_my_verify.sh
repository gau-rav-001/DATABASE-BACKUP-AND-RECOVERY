#!/usr/bin/env bash
set -euo pipefail
DB="${1:-appdb_restored}"
USER="root"
HOST="127.0.0.1"
PASS="1234"
echo "Row counts in $DB:"
mysql -h "$HOST" -u "$USER" -p"$PASS" -e "USE $DB;
SELECT 'customers' AS tbl, COUNT(*) AS rows FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;"
