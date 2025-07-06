-- Task 0: Write Complex Queries with Joins

-- Instruction 1:
-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
-- This query will only return records where there is a match in both the 'Booking' and 'User' tables.
SELECT
    B.booking_id,
    B.check_in_date,
    B.check_out_date,
    B.total_price,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email
FROM
    Booking AS B
INNER JOIN
    User AS U ON B.user_id = U.user_id;

-- Instruction 2:
-- Write a query using a LEFT JOIN to retrieve all properties and their reviews,
-- including properties that have no reviews.
-- This query will return all records from the 'Property' table (left table)
-- and the matching records from the 'Review' table (right table).
-- If there is no match, NULLs will appear for columns from the 'Review' table.
SELECT
    P.property_id,
    P.name AS property_name,
    P.location,
    R.review_id,
    R.rating,
    R.comment
FROM
    Property AS P
LEFT JOIN
    Review AS R ON P.property_id = R.property_id
ORDER BY
    P.property_id;

-- Instruction 3:
-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user.

-- Standard SQL (PostgreSQL, SQL Server, etc.):
/*
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.check_in_date,
    B.check_out_date
FROM
    User AS U
FULL OUTER JOIN
    Booking AS B ON U.user_id = B.user_id;
*/

-- MySQL Workaround for FULL OUTER JOIN:
-- This combines all users and their bookings (LEFT JOIN)
-- with all bookings and their users (RIGHT JOIN, but excluding matches already covered by LEFT JOIN)
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.check_in_date,
    B.check_out_date
FROM
    User AS U
LEFT JOIN
    Booking AS B ON U.user_id = B.user_id
UNION ALL
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.check_in_date,
    B.check_out_date
FROM
    User AS U
RIGHT JOIN
    Booking AS B ON U.user_id = B.user_id
WHERE
    U.user_id IS NULL;
