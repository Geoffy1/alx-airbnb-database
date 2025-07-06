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
