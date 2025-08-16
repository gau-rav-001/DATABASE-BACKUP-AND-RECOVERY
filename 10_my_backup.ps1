$DB = "appdb"
$USER = "root"
$HOST = "127.0.0.1"
$PASS = "1234"
New-Item -ItemType Directory -Force -Path "../../backups" | Out-Null
$STAMP = Get-Date -Format "yyyy-MM-dd_HHmmss"
$FILE = "../../backups/appdb-$STAMP.sql"
mysqldump -h $HOST -u $USER -p$PASS --routines --events --single-transaction $DB > $FILE
Write-Output "Backup created: $FILE"
