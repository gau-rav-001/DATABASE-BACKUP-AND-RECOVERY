#!/usr/bin/env bash
set -euo pipefail
SRC_FILE="${1:-}"
USER="root"
HOST="127.0.0.1"
PASS="1234"
ORIG="appdb"
RESTORED="appdb_restored"

if [[ -z "$SRC_FILE" ]]; then
  SRC_FILE="$(ls -1t ../../backups/appdb-*.sql | head -n1)"
fi
if [[ ! -f "$SRC_FILE" ]]; then
  echo "No backup file found. Provide path as first argument."; exit 1
fi

mysql -h "$HOST" -u "$USER" -p"$PASS" -e "DROP DATABASE IF EXISTS $RESTORED; CREATE DATABASE $RESTORED;"
mysql -h "$HOST" -u "$USER" -p"$PASS" "$RESTORED" < "$SRC_FILE"
echo "Restored to DB: $RESTORED using $SRC_FILE"
