-- Disable foreign key checks temporarily to allow insertion with interdependencies (optional, but useful)
SET FOREIGN_KEY_CHECKS = 0;

--
-- Sample data for table `User`
--
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Alice', 'Smith', 'alice@example.com', 'hashed_password_alice_123', '123-456-7890', 'guest', '2025-01-10 08:00:00'),
('b1c2d3e4-e5f6-7890-1234-567890abcdef', 'Bob', 'Johnson', 'bob@example.com', 'hashed_password_bob_456', NULL, 'host', '2025-02-15 09:30:00'),
('c2d3e4f5-f6a7-8901-2345-67890abcdef0', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password_charlie_789', '987-654-3210', 'guest', '2025-03-20 10:45:00'),
('d3e4f5a6-a7b8-9012-3456-7890abcdef01', 'Diana', 'Prince', 'diana@example.com', 'hashed_password_diana_012', '111-222-3333', 'host', '2025-04-01 11:00:00'),
('e4f5a6b7-b8c9-0123-4567-890abcdef012', 'Eve', 'Adams', 'eve@example.com', 'hashed_password_eve_345', NULL, 'admin', '2025-05-05 14:00:00');

--
-- Sample data for table `Property`
--
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at) VALUES
('f5a6b7c8-c9d0-1234-5678-90abcdef0123', 'b1c2d3e4-e5f6-7890-1234-567890abcdef', 'Cozy Downtown Apartment', 'A charming apartment in the heart of the city.', 'New York, NY', 150.00, '2025-02-20 10:00:00'),
('g6b7c8d9-d0e1-2345-6789-0abcdef01234', 'd3e4f5a6-a7b8-9012-3456-7890abcdef01', 'Sunny Beach House', 'Spacious house with ocean views, perfect for families.', 'Miami, FL', 300.00, '2025-04-05 12:00:00'),
('h7c8d9e0-e1f2-3456-7890-abcdef012345', 'b1c2d3e4-e5f6-7890-1234-567890abcdef', 'Mountain Cabin Retreat', 'Secluded cabin with beautiful forest surroundings.', 'Aspen, CO', 200.00, '2025-03-01 09:00:00');

--
-- Sample data for table `Booking`
--
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('i8d9e0f1-f2a3-4567-8901-abcdef012345', 'f5a6b7c8-c9d0-1234-5678-90abcdef0123', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2025-07-01', '2025-07-07', 900.00, 'confirmed', '2025-05-25 15:00:00'),
('j9e0f1a2-a3b4-5678-9012-bcdef0123456', 'g6b7c8d9-d0e1-2345-6789-0abcdef01234', 'c2d3e4f5-f6a7-8901-2345-67890abcdef0', '2025-08-10', '2025-08-20', 3000.00, 'pending', '2025-06-01 11:00:00'),
('k0f1a2b3-b4c5-6789-0123-cdef01234567', 'h7c8d9e0-e1f2-3456-7890-abcdef012345', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', '2025-09-05', '2025-09-08', 600.00, 'canceled', '2025-06-10 09:00:00');

--
-- Sample data for table `Payment`
--
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('l1a2b3c4-c5d6-7890-1234-567890abcdef', 'i8d9e0f1-f2a3-4567-8901-abcdef012345', 900.00, '2025-05-26 10:00:00', 'credit_card'),
('m2b3c4d5-d6e7-8901-2345-67890abcdef0', 'j9e0f1a2-a3b4-5678-9012-bcdef0123456', 3000.00, '2025-06-02 14:00:00', 'paypal');

--
-- Sample data for table `Review`
--
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('n3c4d5e6-e7f8-9012-3456-7890abcdef01', 'f5a6b7c8-c9d0-1234-5678-90abcdef0123', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 5, 'Absolutely loved the place! Very clean and centrally located.', '2025-07-08 10:00:00'),
('o4d5e6f7-f8a9-0123-4567-890abcdef012', 'g6b7c8d9-d0e1-2345-6789-0abcdef01234', 'c2d3e4f5-f6a7-8901-2345-67890abcdef0', 4, 'Great views, but a bit far from the city center.', '2025-08-21 16:00:00');

--
-- Sample data for table `Message`
--
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('p5e6f7a8-a9b0-1234-5678-90abcdef0123', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b1c2d3e4-e5f6-7890-1234-567890abcdef', 'Is the kitchen fully equipped?', '2025-05-20 09:00:00'),
('q6f7a8b9-b0c1-2345-6789-0abcdef01234', 'b1c2d3e4-e5f6-7890-1234-567890abcdef', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Yes, it has everything you need!', '2025-05-20 09:15:00'),
('r7a8b9c0-c1d2-3456-7890-abcdef012345', 'c2d3e4f5-f6a7-8901-2345-67890abcdef0', 'd3e4f5a6-a7b8-9012-3456-7890abcdef01', 'Can we bring pets to the beach house?', '2025-05-30 13:00:00');

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
