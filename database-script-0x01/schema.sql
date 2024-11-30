-- Create Users Table
CREATE TABLE users (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Properties Table
CREATE TABLE properties (
  property_id UUID PRIMARY KEY,
  host_id UUID NOT NULL,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  price_per_night DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES users(user_id)
);

-- Create Bookings Table
CREATE TABLE bookings (
  booking_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create Payments Table
CREATE TABLE payments (
  payment_id UUID PRIMARY KEY,
  booking_id UUID NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  CONSTRAINT fk_booking FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- Create Reviews Table
CREATE TABLE reviews (
  review_id UUID PRIMARY KEY,
  property_id UUID NOT NULL,
  user_id UUID NOT NULL,
  rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_property_review FOREIGN KEY (property_id) REFERENCES properties(property_id),
  CONSTRAINT fk_user_review FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create Messages Table
CREATE TABLE messages (
  message_id UUID PRIMARY KEY,
  sender_id UUID NOT NULL,
  recipient_id UUID NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES users(user_id),
  CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

-- Create Indexes for Optimization
CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_property_id ON properties(property_id);
CREATE INDEX idx_user_id ON users(user_id);
CREATE INDEX idx_booking_id ON bookings(booking_id);
CREATE INDEX idx_payment_booking_id ON payments(booking_id);
CREATE INDEX idx_review_property_id ON reviews(property_id);
CREATE INDEX idx_review_user_id ON reviews(user_id);
CREATE INDEX idx_message_sender_id ON messages(sender_id);
CREATE INDEX idx_message_recipient_id ON messages(recipient_id);
