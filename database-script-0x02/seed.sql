-- Insert sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role, created_at)
VALUES
  (uuid_generate_v4(), 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', 'guest', NOW()),
  (uuid_generate_v4(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', 'host', NOW()),
  (uuid_generate_v4(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashedpassword3', 'admin', NOW()),
  (uuid_generate_v4(), 'Bob', 'Williams', 'bob.williams@example.com', 'hashedpassword4', 'guest', NOW());

-- Insert sample properties
INSERT INTO properties (property_id, host_id, name, location, price_per_night, created_at)
VALUES
  (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 'Cozy Cottage', 'New York, USA', 100.00, NOW()),
  (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 'Luxury Apartment', 'Los Angeles, USA', 150.00, NOW());

-- Insert sample bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  (uuid_generate_v4(), (SELECT property_id FROM properties WHERE name = 'Cozy Cottage'), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), '2024-12-01', '2024-12-07', 600.00, 'confirmed', NOW()),
  (uuid_generate_v4(), (SELECT property_id FROM properties WHERE name = 'Luxury Apartment'), (SELECT user_id FROM users WHERE email = 'bob.williams@example.com'), '2024-12-05', '2024-12-10', 750.00, 'pending', NOW());

-- Insert sample payments
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (uuid_generate_v4(), (SELECT booking_id FROM bookings WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM users WHERE email = 'john.doe@example.com')), 600.00, NOW(), 'credit_card'),
  (uuid_generate_v4(), (SELECT booking_id FROM bookings WHERE status = 'pending' AND user_id = (SELECT user_id FROM users WHERE email = 'bob.williams@example.com')), 750.00, NOW(), 'paypal');

-- Insert sample reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  (uuid_generate_v4(), (SELECT property_id FROM properties WHERE name = 'Cozy Cottage'), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 5, 'Excellent stay! The cottage was very cozy and well-located.', NOW()),
  (uuid_generate_v4(), (SELECT property_id FROM properties WHERE name = 'Luxury Apartment'), (SELECT user_id FROM users WHERE email = 'bob.williams@example.com'), 4, 'Nice apartment, but the check-in process could be improved.', NOW());

-- Insert sample messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 'Hi, I would like to confirm my booking for the Cozy Cottage.', NOW()),
  (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'bob.williams@example.com'), (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 'Can you provide more details about the Luxury Apartment?', NOW());
