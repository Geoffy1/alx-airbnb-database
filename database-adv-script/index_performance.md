# Index Implementation and Performance Analysis Report

This document outlines the indexing strategy applied to the Airbnb backend database and provides instructions on how to measure the performance impact of these indexes. This is part of the "Unleashing Advanced Querying Power" project.

## 1. Identified High-Usage Columns for Indexing

Based on typical application usage patterns (columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses) and the provided database schema, the following columns were identified as candidates for indexing to improve query performance:

* **`User` Table:**
    * `email`: Critical for login and user lookups.
* **`Property` Table:**
    * `host_id`: Foreign key, frequently used in joins to link properties to their hosts.
    * `location`: Common search criterion.
    * `price_per_night`: Potentially used for filtering and sorting search results.
* **`Booking` Table:**
    * `user_id`: Foreign key, linking bookings to users.
    * `property_id`: Foreign key, linking bookings to properties.
    * `check_in_date`, `check_out_date`: Crucial for date range queries and availability checks. A composite index on `(property_id, check_in_date, check_out_date)` is particularly beneficial here.
* **`Review` Table:**
    * `property_id`: Foreign key, linking reviews to properties.
    * `user_id`: Foreign key, linking reviews to users.

Primary key columns are assumed to be automatically indexed by the database system.

## 2. SQL Index Creation Commands

The `database_index.sql` file contains the `CREATE INDEX` commands for the identified columns. Executing this script will add the specified indexes to your database schema.

**File:** [`database_index.sql`](./database_index.sql)

## 3. Measuring Query Performance (Before & After Indexing)

To observe the benefits of indexing, it is essential to measure the performance of relevant queries *before* and *after* applying the indexes.

**Steps for Performance Measurement:**

1.  **Baseline Measurement (Before Indexing):**
    * **Ensure no indexes (other than primary keys) exist** on the target columns. If you've previously run index creation scripts, you might need to `DROP INDEX` them for a true baseline.
    * **Execute a representative complex query** that uses one or more of the columns targeted for indexing (e.g., a query filtering properties by location, joining bookings with users, or finding properties with specific price ranges).
    * **Analyze the query execution plan** using database-specific tools:
        * **MySQL:** `EXPLAIN SELECT ...` or `EXPLAIN ANALYZE SELECT ...` (for MySQL 8.0+)
        * **PostgreSQL:** `EXPLAIN ANALYZE SELECT ...`
        * **SQL Server:** `SET STATISTICS IO ON; SET STATISTICS TIME ON; SELECT ...` (then examine messages tab)
    * **Record:** Note down the `rows scanned`, `cost`, `execution time`, and whether any table scans occurred.

2.  **Apply Indexes:**
    * Execute the SQL commands in `database_index.sql` on your database.

3.  **Post-Indexing Measurement:**
    * **Re-execute the *exact same* representative complex query** from step 1.
    * **Analyze its execution plan** again using `EXPLAIN` or `EXPLAIN ANALYZE`.
    * **Record:** Compare the `rows scanned`, `cost`, and `execution time` with your baseline measurements.

**Expected Improvements:**

You should observe a significant reduction in `rows scanned` (indicating that the database is using the index instead of scanning the entire table), lower `cost` estimates, and faster `execution times` for queries that benefit from the new indexes. This is particularly noticeable on tables with a large number of rows.

**Example Query to Test (before and after `idx_property_location`):**

```sql
-- Example query to test property location search
SELECT property_id, name, description, location
FROM Property
WHERE location = 'New York';
