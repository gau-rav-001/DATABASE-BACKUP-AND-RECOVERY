#!/usr/bin/env bash
set -euo pipefail
DB="appdb"
USER="root"
HOST="127.0.0.1"
PASS="1234"
mkdir -p "../../backups"
STAMP="$(date +%F_%H%M%S)"
FILE="../../backups/{DB}-{STAMP}.sql"
mysqldump -h "$HOST" -u "$USER" -p"$PASS" --routines --events --single-transaction "$DB" > "$FILE"
echo "Backup created: $FILE"
