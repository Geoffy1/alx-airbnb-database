-- Task 2: Apply Aggregations and Window Functions

-- Instruction 1:
-- Write a query to find the total number of bookings made by each user,
-- using the COUNT function and GROUP BY clause.
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    COUNT(B.booking_id) AS total_bookings
FROM
    User AS U
LEFT JOIN -- Use LEFT JOIN to include users who might not have any bookings
    Booking AS B ON U.user_id = B.user_id
GROUP BY
    U.user_id, U.first_name, U.last_name -- Include non-aggregated columns in GROUP BY
ORDER BY
    total_bookings DESC, U.first_name, U.last_name;

-- Instruction 2:
-- Use a window function (ROW_NUMBER, RANK) to rank properties
-- based on the total number of bookings they have received.
-- We'll use both ROW_NUMBER and RANK for demonstration.

-- First, calculate total bookings per property using a CTE for clarity
WITH PropertyBookingCounts AS (
    SELECT
        P.property_id,
        P.name AS property_name,
        P.location,
        COUNT(B.booking_id) AS total_bookings
    FROM
        Property AS P
    LEFT JOIN -- Include properties with zero bookings
        Booking AS B ON P.property_id = B.property_id
    GROUP BY
        P.property_id, P.name, P.location
)
SELECT
    property_id,
    property_name,
    location,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC, property_name) AS row_num_rank,
    RANK() OVER (ORDER BY total_bookings DESC, property_name) AS rank_val
FROM
    PropertyBookingCounts
ORDER BY
    total_bookings DESC, property_name;
