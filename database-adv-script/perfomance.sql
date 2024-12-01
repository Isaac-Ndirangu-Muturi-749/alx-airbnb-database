-- Initial complex query
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    py.amount,
    py.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments py ON b.booking_id = py.booking_id;

-- Optimized query (with appropriate indexing applied)
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    py.amount,
    py.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments py ON b.booking_id = py.booking_id;
