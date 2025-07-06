# Table Partitioning Performance Report

This report documents the implementation of table partitioning on the `Booking` table and discusses the expected performance improvements. This is part of the "Unleashing Advanced Querying Power" project.

## 1. Partitioning Strategy

To address potential performance bottlenecks in the `Booking` table, especially with large datasets and frequent date-range queries, `RANGE` partitioning has been implemented based on the `check_in_date` column.

**Implementation Details:**

* **Table:** `Booking`
* **Partitioning Key:** `YEAR(check_in_date)` (or `YEAR(start_date)` as per task, mapped to `check_in_date` in our schema).
* **Partition Type:** `RANGE` partitioning.
* **Partitions:** The table is divided into multiple partitions, typically corresponding to years or specific date ranges (e.g., `p2023` for bookings in 2023, `p2024` for 2024, and a `p_future` partition for all later dates). This allows the database to store rows in separate physical segments based on their `check_in_date`.

The SQL commands for this implementation are provided in `partitioning.sql`.

## 2. Testing Performance with Partitioned Table

To observe the benefits of partitioning, you should perform benchmark queries before and after implementing the partitioning.

**Test Scenario:**

Focus on queries that filter data by date ranges on the `check_in_date` column, as these are the queries that benefit most from range partitioning.

**Example Test Query:**

```sql
SELECT
    booking_id,
    property_id,
    user_id,
    check_in_date,
    total_price
FROM
    Booking
WHERE
    check_in_date >= '2024-03-01' AND check_in_date < '2024-04-01';
