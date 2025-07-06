# Query Optimization Report

This report details the process of optimizing a complex SQL query that retrieves comprehensive booking information. It includes an analysis of the initial query's performance and the refactoring steps taken to improve efficiency. This is part of the "Unleashing Advanced Querying Power" project.

## 1. Initial Complex Query

The initial query was designed to fetch all booking details along with associated user, property, and payment information. This query involves multiple `JOIN` operations to bring data from four different tables (`Booking`, `User`, `Property`, `Payment`).

**Initial Query (`performance.sql`):**

```sql
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
LEFT JOIN
    Payment AS Py ON B.booking_id = Py.booking_id;
