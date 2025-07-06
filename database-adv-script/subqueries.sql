-- Task 1: Practice Subqueries

-- Instruction 1:
-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
-- This is a non-correlated subquery as the inner query can run independently.
SELECT
    P.property_id,
    P.name AS property_name,
    P.location
FROM
    Property AS P
WHERE
    P.property_id IN (
        SELECT
            R.property_id
        FROM
            Review AS R
        GROUP BY
            R.property_id
        HAVING
            AVG(R.rating) > 4.0
    );

-- Instruction 2:
-- Write a correlated subquery to find users who have made more than 3 bookings.
-- This is a correlated subquery because the inner query depends on the outer query's 'user_id'.
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    U.email
FROM
    User AS U
WHERE
    (
        SELECT
            COUNT(B.booking_id)
        FROM
            Booking AS B
        WHERE
            B.user_id = U.user_id -- This is the correlation: inner query refers to outer query's User ID
    ) > 3;
