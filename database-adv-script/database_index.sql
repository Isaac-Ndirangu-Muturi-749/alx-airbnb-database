-- Measure query performance before adding indexes
EXPLAIN ANALYZE
SELECT
    p.name AS property_name,
    b.start_date,
    b.end_date,
    u.email
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE p.location = 'New York';

-- Create index on high-usage columns
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_properties_location ON properties (location);

-- Measure query performance after adding indexes
EXPLAIN ANALYZE
SELECT
    p.name AS property_name,
    b.start_date,
    b.end_date,
    u.email
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE p.location = 'New York';
