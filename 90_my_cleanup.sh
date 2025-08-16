#!/usr/bin/env bash
set -euo pipefail
KEEP="${1:-7}"
cd ../../backups
ls -1t appdb-*.sql | tail -n +$((KEEP+1)) | xargs -r rm -f
echo "Retention applied: kept $KEEP latest MySQL dumps."
