-- Partition the bookings table by start_date
CREATE TABLE bookings_partitioned (
    booking_id uuid NOT NULL,
    property_id uuid NOT NULL,
    user_id uuid NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    total_price decimal NOT NULL,
    status text NOT NULL,
    created_at timestamp NOT NULL
) PARTITION BY RANGE (start_date);

-- Example partition creation
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
