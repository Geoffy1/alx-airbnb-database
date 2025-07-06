-- Implement Indexes for Optimization

-- This script contains SQL commands to create indexes on high-usage columns
-- within the Airbnb database schema, aiming to improve query performance.

-- Recommended Indexes based on common query patterns (WHERE, JOIN, ORDER BY)
-- and the provided database specification.

-- 1. Index on User table's 'email' column
--    - Frequently used for login and user lookup.
--    - Although 'email' has a UNIQUE constraint which typically implies an index,
--      explicitly ensuring a B-tree index for lookup optimization is good practice.
CREATE INDEX idx_user_email ON User (email);

-- 2. Index on Property table's 'host_id' column
--    - 'host_id' is a Foreign Key to the User table.
--    - Essential for efficiently retrieving properties owned by a specific host (JOINs with User).
CREATE INDEX idx_property_host_id ON Property (host_id);

-- 3. Index on Property table's 'location' column
--    - Frequently used in search queries (e.g., "properties in Paris").
CREATE INDEX idx_property_location ON Property (location);

-- 4. Index on Booking table's 'user_id' column
--    - 'user_id' is a Foreign Key to the User table.
--    - Crucial for efficiently retrieving bookings made by a specific user (JOINs with User).
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- 5. Index on Booking table's 'property_id' column
--    - 'property_id' is a Foreign Key to the Property table.
--    - Essential for efficiently retrieving bookings for a specific property (JOINs with Property).
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- 6. Composite Index on Booking table's 'property_id', 'check_in_date', 'check_out_date'
--    - Often used together for availability checks and date range queries.
--    - A composite index can significantly speed up queries that filter or order by these columns.
CREATE INDEX idx_booking_property_dates ON Booking (property_id, check_in_date, check_out_date);

-- 7. Index on Review table's 'property_id' column
--    - 'property_id' is a Foreign Key to the Property table.
--    - Important for efficiently retrieving reviews for a specific property (JOINs with Property).
CREATE INDEX idx_review_property_id ON Review (property_id);

-- 8. Index on Review table's 'user_id' column
--    - 'user_id' is a Foreign Key to the User table.
--    - Important for efficiently retrieving reviews given by a specific user (JOINs with User).
CREATE INDEX idx_review_user_id ON Review (user_id);

-- Note: Primary Key columns (user_id, property_id, booking_id, review_id, payment_id, message_id)
-- are typically indexed automatically by the database management system.
-- These CREATE INDEX statements focus on secondary indexes for performance optimization.
