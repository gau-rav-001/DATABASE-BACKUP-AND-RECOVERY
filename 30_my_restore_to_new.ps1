param([string]$SrcFile)
$USER = "root"
$HOST = "127.0.0.1"
$PASS = "1234"
$ORIG = "appdb"
$RESTORED = "appdb_restored"

if (-not $SrcFile) {
  $SrcFile = (Get-ChildItem ../../backups/appdb-*.sql | Sort-Object LastWriteTime -Descending | Select-Object -First 1).FullName
}
if (-not (Test-Path $SrcFile)) {
  Write-Error "No backup file found. Provide path as first argument."; exit 1
}

mysql -h $HOST -u $USER -p$PASS -e "DROP DATABASE IF EXISTS $RESTORED; CREATE DATABASE $RESTORED;"
Get-Content $SrcFile | mysql -h $HOST -u $USER -p$PASS $RESTORED
Write-Output "Restored to DB: $RESTORED using $SrcFile"
