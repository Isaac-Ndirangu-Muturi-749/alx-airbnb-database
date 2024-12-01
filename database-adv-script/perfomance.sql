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
JOIN payments py ON b.booking_id = py.booking_id
WHERE py.payment_method = 'credit_card'  -- Filter for specific payment method
AND b.start_date >= '2024-01-01';         -- Filter for bookings after January 1, 2024

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
LEFT JOIN payments py ON b.booking_id = py.booking_id
WHERE p.location = 'New York'  -- Filter for properties in New York
AND (b.end_date BETWEEN '2024-01-01' AND '2024-12-31');  -- Filter for bookings in 2024
