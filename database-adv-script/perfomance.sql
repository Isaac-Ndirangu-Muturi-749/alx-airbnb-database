-- Analyze the initial query's performance using EXPLAIN
EXPLAIN
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

-- Optimized query (with appropriate indexing applied and performance analysis)
EXPLAIN
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
