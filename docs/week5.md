# Week 5 Bonus: RDS Read Replicas
- Created read replica for `grocerymate-rds`: `grocerymate-rds-replica`.
- Endpoint: `grocerymate-rds-replica.cfy20qqqkdjn.eu-central-1.rds.amazonaws.com`.
- Verified replica status: Available.
- Tested read query: `SELECT * FROM products LIMIT 1;` (table `groceries` not found, used `products` instead).
- Confirmed tables: `basket_items`, `products`, `reviews`, `users`.
- Enabled public accessibility and added security group rule (TCP, 5432, My IP).
- Commands: `aws rds create-db-instance-read-replica`, `psql`, `\dt`.
