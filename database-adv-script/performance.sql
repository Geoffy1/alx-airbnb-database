-- Task 4: Optimize Complex Queries

-- Instruction 1:
-- Write an initial query that retrieves all bookings along with the user details,
-- property details, and payment details.

-- Initial Query (Potentially Inefficient - for analysis)
-- This query uses multiple INNER JOINs, which might be inefficient if not properly indexed
-- or if data distribution causes issues (e.g., many-to-many relationships without proper handling).
-- It also selects all columns from joined tables, which may not always be necessary.
SELECT
    B.booking_id,
    B.check_in_date,
    B.check_out_date,
    B.total_price AS booking_total_price,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    P.property_id,
    P.name AS property_name,
    P.location,
    Py.payment_id,
    Py.amount AS payment_amount,
    Py.payment_date,
    Py.payment_method
FROM
    Booking AS B
INNER JOIN
    User AS U ON B.user_id = U.user_id
INNER JOIN
    Property AS P ON B.property_id = P.property_id
LEFT JOIN -- Use LEFT JOIN here as a booking might not have a payment recorded yet, or it might be pending.
    Payment AS Py ON B.booking_id = Py.booking_id;


-- Instruction 3:
-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.

-- Refactored/Optimized Query
-- Optimizations Applied:
-- 1. Explicit selection of only necessary columns to reduce data transfer.
-- 2. Assuming proper indexing on foreign key columns (B.user_id, B.property_id, Py.booking_id)
--    and primary keys (U.user_id, P.property_id, B.booking_id).
--    These indexes allow the database to efficiently perform JOIN operations.
-- 3. While the number of JOINs remains the same, their efficiency is improved by indexes.
--    No 'unnecessary' joins are present if all details are required by the business logic.
--    If specific details are not needed, those joins could be removed.
-- 4. Consider adding specific WHERE clauses if this query is often run for filtered data
--    (e.g., for a specific user, property, or date range), which would further leverage indexes.
--    For this general query, the main optimization comes from efficient JOIN execution due to indexes.
SELECT
    B.booking_id,
    B.check_in_date,
    B.check_out_date,
    B.total_price AS booking_total_price,
    U.first_name AS user_first_name,
    U.last_name AS user_last_name,
    P.name AS property_name,
    P.location AS property_location,
    Py.amount AS payment_amount,
    Py.payment_date
FROM
    Booking AS B
INNER JOIN
    User AS U ON B.user_id = U.user_id
INNER JOIN
    Property AS P ON B.property_id = P.property_id
LEFT JOIN
    Payment AS Py ON B.booking_id = Py.booking_id;
