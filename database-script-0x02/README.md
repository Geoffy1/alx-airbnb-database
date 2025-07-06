# Database Seeding Script (DML)

This directory contains the SQL script (`seed.sql`) designed to populate the ALX Airbnb database with sample data. This script uses Data Manipulation Language (DML) statements (`INSERT INTO`) to add realistic records to all tables defined in the schema.

## Files

* `seed.sql`: Contains `INSERT INTO` statements for all database tables.
* `README.md`: This file, explaining the contents and purpose of the seeding script.

## Purpose

The primary purpose of `seed.sql` is to:

* **Provide Sample Data:** Fill the empty database tables with meaningful data that simulates real-world usage of an Airbnb-like application.
* **Demonstrate Relationships:** Illustrate how records across different tables are linked via foreign keys (e.g., bookings are associated with specific users and properties).
* **Facilitate Testing:** Provide a dataset that can be used for testing queries, application logic, and overall database functionality during development.

## Data Included

The `seed.sql` script includes sample data for:

* **Users:** A mix of guests, hosts, and an admin.
* **Properties:** Various types of properties hosted by different users.
* **Bookings:** Sample bookings for properties by different users, with various statuses (confirmed, pending, canceled).
* **Payments:** Payments linked to existing bookings.
* **Reviews:** User reviews for properties.
* **Messages:** Sample messages exchanged between users.

## How to Use

To populate your database with this sample data, ensure your database schema (from `schema.sql`) is already created. Then, execute the `seed.sql` script using your preferred SQL client or database management tool.

**Important Note:** The script temporarily disables and re-enables `FOREIGN_KEY_CHECKS` at the beginning and end, respectively. This is a common practice during seeding to prevent foreign key constraint errors when inserting interdependent data that might not be in perfect insertion order.
