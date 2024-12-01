-- Create index on high-usage columns
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_properties_location ON properties (location);
