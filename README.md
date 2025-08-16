# DATABASE-BACKUP-AND-RECOVERY

# Database Backup & Restore Demo (PostgreSQL + MySQL/MariaDB)

**Last generated:** 2025-08-16 05:27:05

This self‑contained demo shows how to:
1. Back up a database.
2. Simulate a failure.
3. Restore from backup.
4. Verify the restored data.

It includes ready-to-run scripts for both Linux/macOS (bash) and Windows (PowerShell).  
You can use **either PostgreSQL or MySQL/MariaDB** parts depending on your stack.

> **Note:** These scripts are for demo/teaching. In production, add encryption, monitoring, error handling, and offsite storage.

---

## Prerequisites

### For PostgreSQL
- `pg_dump`, `pg_restore`, `psql` available in PATH (install PostgreSQL client tools).
- Example credentials used: **user:** `postgres`, **host:** `localhost`
- Example DB name: `appdb` (change as needed).
- Set the `PGPASSWORD` environment variable for non-interactive auth or create a `.pgpass` file.

### For MySQL/MariaDB
- `mysqldump`, `mysql` CLI tools available in PATH.
- Example credentials used: **user:** `root`, **host:** `127.0.0.1`
- Example DB name: `appdb` (change as needed).
- For non-interactive auth in demo, password is embedded in commands. For production, prefer `.my.cnf` or env vars.

---

## Directory Layout

```
db-backup-restore-demo/
├── backups/                # Backups will be written here
├── scripts/
│   ├── postgres/           # PostgreSQL bash + PowerShell scripts
│   └── mysql/              # MySQL/MariaDB bash + PowerShell scripts
└── README.md               # This documentation
```

---

## QUICK START (PostgreSQL on Linux/macOS)

```bash
cd scripts/postgres
# 1) Create a test DB with sample data (optional if you already have a DB)
bash 00_pg_create_sample.sh

# 2) Back up
bash 10_pg_backup.sh

# 3) Simulate failure (drop a table)
bash 20_pg_simulate_failure.sh

# 4) Restore into a *new* DB (safest for verification)
bash 30_pg_restore_to_new.sh

# 5) Verify row counts
bash 40_pg_verify.sh
```

## QUICK START (PostgreSQL on Windows PowerShell)

```powershell
cd scripts/postgres
# 1) Create sample DB
./00_pg_create_sample.ps1

# 2) Backup
./10_pg_backup.ps1

# 3) Simulate failure
./20_pg_simulate_failure.ps1

# 4) Restore to new DB
./30_pg_restore_to_new.ps1

# 5) Verify
./40_pg_verify.ps1
```

## QUICK START (MySQL/MariaDB on Linux/macOS)

```bash
cd scripts/mysql
# 1) Create a test DB with sample data
bash 00_my_create_sample.sh

# 2) Backup
bash 10_my_backup.sh

# 3) Simulate failure (drop a table)
bash 20_my_simulate_failure.sh

# 4) Restore into a new DB
bash 30_my_restore_to_new.sh

# 5) Verify row counts
bash 40_my_verify.sh
```

## QUICK START (MySQL/MariaDB on Windows PowerShell)

```powershell
cd scripts/mysql
# 1) Create sample DB
./00_my_create_sample.ps1

# 2) Backup
./10_my_backup.ps1

# 3) Simulate failure
./20_my_simulate_failure.ps1

# 4) Restore to new DB
./30_my_restore_to_new.ps1

# 5) Verify
./40_my_verify.ps1
```

---

## Retention & Scheduling (Summary)

- **Retention:** Keep N most recent backups (e.g., 7 daily, 4 weekly, 3 monthly). See the optional cleanup scripts for both stacks.
- **Linux/macOS Scheduling:** Use `crontab -e` to run `10_pg_backup.sh` or `10_my_backup.sh` nightly.
- **Windows Scheduling:** Use Task Scheduler to run the PowerShell equivalents.
- **Offsite:** Sync `backups/` to S3/Drive or another server.
- **Encryption:** Consider `gpg` or OS-native encryption.

---

## Disaster Recovery Mode

1. **Stop writes** to the broken database.
2. **Choose a restore point / backup file** from `backups/`.
3. **Restore into a new DB** (safe approach) using the provided restore-to-new scripts.
4. **Validate** with the verify scripts and application smoke tests.
5. **Switch** application connection string to the restored DB.
6. **Post-mortem:** Identify root cause and patch.

---

## Customization

- Change DB names, users, and passwords at the top of scripts.
- For PostgreSQL, you can pass a specific `.dump` filename to restore scripts.
- For MySQL, you can pass a `.sql` filename likewise.

---

Happy backing up! 🚀
