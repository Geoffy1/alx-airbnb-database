# Database Schema Definition (DDL)

This directory contains the SQL script (`schema.sql`) responsible for defining the database schema for the ALX Airbnb project. This script uses Data Definition Language (DDL) to create all necessary tables, establish relationships, define constraints, and set up indexes for optimal performance.

## Files

* `schema.sql`: Contains `CREATE TABLE` and `CREATE INDEX` statements for the entire database.
* `README.md`: This file, explaining the contents and purpose of the schema script.

## Schema Overview

The `schema.sql` script creates the following tables as per the project specification:

* **`User`**: Stores information about users, including guests, hosts, and administrators.
* **`Property`**: Contains details about rental properties available on the platform, linked to a specific host.
* **`Booking`**: Records booking details for properties, linking users to properties for specific date ranges.
* **`Payment`**: Stores payment information associated with bookings.
* **`Review`**: Holds user reviews and ratings for properties.
* **`Message`**: Manages direct messages between users.

## Key Features of the Schema

* **Primary Keys (PKs):** Each table includes a `UUID` primary key to uniquely identify records, ensuring data integrity.
* **Foreign Keys (FKs):** Relationships between tables are established using foreign keys (e.g., `host_id` in `Property` references `user_id` in `User`), maintaining referential integrity.
* **Data Types:** Appropriate data types (e.g., `UUID`, `VARCHAR`, `TEXT`, `DECIMAL`, `DATE`, `TIMESTAMP`, `ENUM`, `INTEGER`) are used for each column to store data efficiently.
* **Constraints:**
    * `NOT NULL`: Ensures essential fields cannot be left empty.
    * `UNIQUE`: Enforces uniqueness for specific columns (e.g., `email` in `User`).
    * `ENUM`: Restricts column values to a predefined set (e.g., `role`, `status`, `payment_method`).
    * `CHECK`: Ensures numeric values are within a specified range (e.g., `rating` in `Review`).
* **Indexes:** Indexes are created on frequently queried columns (e.g., `email`, `property_id`, `booking_id`) to accelerate data retrieval operations.

## How to Use

To set up the database schema, simply execute the `schema.sql` script using your preferred SQL client or database management tool. This will create all the tables and their associated constraints and indexes, preparing the database for data insertion.
