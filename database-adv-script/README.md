# Advanced SQL Queries - Joins

This directory contains SQL scripts demonstrating various types of join operations, as part of the "Unleashing Advanced Querying Power" project for the ALX Airbnb Database Module.

## `joins_queries.sql`

This file includes the following complex queries:

1.  **INNER JOIN:** Retrieves all bookings along with the details of the users who made them. This showcases how to combine rows from two tables based on a matching column, returning only the intersecting data.
    * **Objective:** Find all bookings and their associated users.
    * **Tables Involved:** `Booking`, `User`

2.  **LEFT JOIN:** Retrieves all property listings and any associated reviews, including properties that do not have any reviews yet. This demonstrates how to retrieve all records from the "left" table and matching records from the "right" table, with `NULL` values for unmatched rows in the right table.
    * **Objective:** List all properties and their reviews (if any).
    * **Tables Involved:** `Property`, `Review`

3.  **FULL OUTER JOIN (with MySQL Workaround):** Aims to retrieve all users and all bookings, regardless of whether a user has made a booking or if a booking exists without a linked user. This illustrates a comprehensive combination of data from both tables.
    * **Objective:** See all users and all bookings in one combined result, including those with no direct matches.
    * **Tables Involved:** `User`, `Booking`
    * **Note:** Standard SQL `FULL OUTER JOIN` syntax is provided, along with a common `LEFT JOIN` + `UNION ALL` + `RIGHT JOIN` workaround for MySQL, which does not natively support `FULL OUTER JOIN`.

These queries help master the fundamental concepts and practical application of SQL joins for efficient data retrieval from relational databases.

# Advanced SQL Queries - Subqueries

This directory contains SQL scripts demonstrating the use of subqueries, both non-correlated and correlated, as part of the "Unleashing Advanced Querying Power" project for the ALX Airbnb Database Module.

## `subqueries.sql`

This file includes the following complex queries:

1.  **Non-Correlated Subquery: Properties with Average Rating > 4.0**
    * **Objective:** Identify properties that have received an average rating higher than 4.0.
    * **Description:** The inner subquery calculates the average rating for each property independently and filters for those meeting the criteria. The outer query then retrieves the details of these properties. This subquery is "non-correlated" because it does not depend on rows from the outer query for its execution.
    * **Tables Involved:** `Property`, `Review`

2.  **Correlated Subquery: Users with More Than 3 Bookings**
    * **Objective:** Find users who have made more than three bookings.
    * **Description:** The inner subquery counts the number of bookings for each `user_id` passed from the outer query's `User` table. This subquery is "correlated" because its execution depends on values (`U.user_id`) from the outer query, making it re-evaluate for each row processed by the outer query.
    * **Tables Involved:** `User`, `Booking`

Illustrate how subqueries can be effectively used for advanced data filtering and analysis where conditions rely on aggregate results or row-by-row comparisons.
