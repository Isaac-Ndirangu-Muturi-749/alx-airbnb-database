# Requirements for Airbnb Database

## Overview
This document outlines the requirements for the Airbnb-like relational database system, which includes entities such as Users, Properties, Bookings, Payments, Reviews, and Messages. The system should support fundamental operations like user management, property listing, booking, payments, reviews, and messaging.

## Entities and Attributes

### 1. **User**
- **user_id** (UUID, PK, Indexed)
- **first_name** (VARCHAR, NOT NULL)
- **last_name** (VARCHAR, NOT NULL)
- **email** (VARCHAR, UNIQUE, NOT NULL)
- **password_hash** (VARCHAR, NOT NULL)
- **phone_number** (VARCHAR, NULL)
- **role** (ENUM: guest, host, admin, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. **Property**
- **property_id** (UUID, PK, Indexed)
- **host_id** (UUID, FK, references `User(user_id)`)
- **name** (VARCHAR, NOT NULL)
- **description** (TEXT, NOT NULL)
- **location** (VARCHAR, NOT NULL)
- **price_per_night** (DECIMAL, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **updated_at** (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### 3. **Booking**
- **booking_id** (UUID, PK, Indexed)
- **property_id** (UUID, FK, references `Property(property_id)`)
- **user_id** (UUID, FK, references `User(user_id)`)
- **start_date** (DATE, NOT NULL)
- **end_date** (DATE, NOT NULL)
- **total_price** (DECIMAL, NOT NULL)
- **status** (ENUM: pending, confirmed, canceled, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 4. **Payment**
- **payment_id** (UUID, PK, Indexed)
- **booking_id** (UUID, FK, references `Booking(booking_id)`)
- **amount** (DECIMAL, NOT NULL)
- **payment_date** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- **payment_method** (ENUM: credit_card, paypal, stripe, NOT NULL)

### 5. **Review**
- **review_id** (UUID, PK, Indexed)
- **property_id** (UUID, FK, references `Property(property_id)`)
- **user_id** (UUID, FK, references `User(user_id)`)
- **rating** (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
- **comment** (TEXT, NOT NULL)
- **created_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 6. **Message**
- **message_id** (UUID, PK, Indexed)
- **sender_id** (UUID, FK, references `User(user_id)`)
- **recipient_id** (UUID, FK, references `User(user_id)`)
- **message_body** (TEXT, NOT NULL)
- **sent_at** (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## Relationships

- **User ↔ Property**: A user (host) can own multiple properties. (One-to-Many)
- **User ↔ Booking**: A user (guest) can make multiple bookings. (One-to-Many)
- **Property ↔ Booking**: A property can have multiple bookings. (One-to-Many)
- **Booking ↔ Payment**: Each booking can have one or more payments. (One-to-One)
- **User ↔ Review**: A user (guest) can review multiple properties. (One-to-Many)
- **Property ↔ Review**: A property can have multiple reviews from different users. (One-to-Many)
- **User ↔ Message**: A user can send multiple messages to other users. (One-to-Many)
- **User ↔ Message**: A user can receive multiple messages from other users. (One-to-Many)

## Constraints

### User Table
- **Unique constraint** on `email` to ensure no two users share the same email address.
- **Non-null constraints** on `first_name`, `last_name`, `email`, `password_hash`, and `role` to ensure essential information is always provided.

### Property Table
- **Foreign key constraint** on `host_id` to ensure a valid reference to a user (host).
- **Non-null constraints** on `name`, `description`, `location`, and `price_per_night` to ensure each property is fully described.

### Booking Table
- **Foreign key constraints** on `property_id` and `user_id` to ensure bookings are linked to valid properties and users.
- **Status constraints**: `status` must be one of the following values: pending, confirmed, or canceled.
- **Non-null constraints** on `start_date`, `end_date`, and `total_price` to ensure complete booking data.

### Payment Table
- **Foreign key constraint** on `booking_id` to ensure each payment is linked to a valid booking.
- **Non-null constraint** on `amount` to ensure a valid payment amount.
- **Payment method constraint**: `payment_method` must be one of the following values: credit_card, paypal, or stripe.

### Review Table
- **Foreign key constraints** on `property_id` and `user_id` to ensure reviews are linked to valid properties and users.
- **Rating constraint**: `rating` must be between 1 and 5.
- **Non-null constraints** on `comment` to ensure the review has content.

### Message Table
- **Foreign key constraints** on `sender_id` and `recipient_id` to ensure messages are sent and received between valid users.
- **Non-null constraint** on `message_body` to ensure that the message content is present.

## Indexing

- **Primary Keys**: Indexed automatically.
- **Additional Indexes**:
  - `email` in the User table for faster user lookup.
  - `property_id` in the Property and Booking tables for efficient property and booking searches.
  - `booking_id` in the Booking and Payment tables to optimize payment-related queries.

---
