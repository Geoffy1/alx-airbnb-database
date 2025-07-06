-- Task 5: Partitioning Large Tables

-- This script demonstrates how to implement table partitioning on the 'Booking' table
-- based on the 'check_in_date' column. Partitioning helps in managing large datasets
-- and improving query performance, especially for queries filtering by date ranges.

-- IMPORTANT: Partitioning syntax is database-specific. This example uses MySQL syntax
-- for RANGE partitioning. Adjust accordingly for PostgreSQL, SQL Server, Oracle, etc.

-- Scenario 1: Creating a new partitioned Booking table (recommended for large tables)
-- If your Booking table is not yet created or you are re-creating it for partitioning.
-- This example partitions bookings into years. You can adjust ranges as needed.
-- You would typically drop the old Booking table (after backup) before creating this new one.

-- DROP TABLE IF EXISTS Booking_old; -- Use with extreme caution and proper backup!
-- RENAME TABLE Booking TO Booking_old; -- Use to rename existing table before creating new partitioned one

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
PARTITION BY RANGE (YEAR(check_in_date)) (
    PARTITION p0 VALUES LESS THAN (2023), -- Bookings before 2023
    PARTITION p2023 VALUES LESS THAN (2024), -- Bookings for 2023
    PARTITION p2024 VALUES LESS THAN (2025), -- Bookings for 2024
    PARTITION p2025 VALUES LESS THAN (2026), -- Bookings for 2025
    PARTITION p2026 VALUES LESS THAN (2027), -- Bookings for 2026
    PARTITION p_future VALUES LESS THAN MAXVALUE -- Bookings for 2027 and beyond
);

-- Note:
-- - You must include all columns from the original table, including primary and foreign keys.
-- - The partitioning column (check_in_date here) should ideally be part of the primary key
--   if you are using MySQL's stricter rules for some partitioning types.
-- - For existing tables, a common approach is to create a new partitioned table,
--   transfer data, and then swap/rename tables. `ALTER TABLE` for adding partitioning
--   to an *existing* non-partitioned table with data is often complex and
--   database-specific (e.g., MySQL requires dumping and reloading for range/list).

-- Example of adding a new partition to an existing partitioned table (MySQL syntax):
-- ALTER TABLE Booking ADD PARTITION (
--     PARTITION p2027 VALUES LESS THAN (2028)
-- );

-- Example: Testing queries on the partitioned table
-- A query filtering by date range will only scan relevant partitions,
-- improving performance.
SELECT
    booking_id,
    property_id,
    user_id,
    check_in_date,
    check_out_date,
    total_price
FROM
    Booking
WHERE
    check_in_date >= '2024-01-01' AND check_in_date < '2025-01-01';

-- To check partition status (MySQL):
-- SELECT
--   PARTITION_NAME,
--   TABLE_ROWS,
--   DATA_LENGTH / 1024 / 1024 AS DataLengthMB
-- FROM INFORMATION_SCHEMA.PARTITIONS
-- WHERE TABLE_SCHEMA = 'your_database_name' AND TABLE_NAME = 'Booking';
