#!/usr/bin/env bash
set -euo pipefail
DB="appdb"
USER="root"
HOST="127.0.0.1"
PASS="1234"
mysql -h "$HOST" -u "$USER" -p"$PASS" -e "CREATE DATABASE IF NOT EXISTS $DB; USE $DB;
CREATE TABLE IF NOT EXISTS customers(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(120) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS orders(
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  amount DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT IGNORE INTO customers(id, name, email) VALUES
  (1,'Alice','alice@example.com'),
  (2,'Bob','bob@example.com');
INSERT INTO orders(customer_id, amount) VALUES (1,123.45),(2,67.89);"
echo "Sample MySQL DB and data ready: $DB"
