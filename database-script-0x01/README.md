### Key Points:
1. **Primary Keys**: Each table uses UUID as the primary key (`user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`).

2. **Foreign Keys**:
   - The `properties` table references the `users` table for `host_id`.
   - The `bookings` table references the `properties` table for `property_id` and the `users` table for `user_id`.
   - The `payments` table references the `bookings` table for `booking_id`.
   - The `reviews` table references both `properties` and `users` tables for `property_id` and `user_id`.
   - The `messages` table references the `users` table for `sender_id` and `recipient_id`.

3. **Constraints**:
   - **ENUM**: Used for `role`, `status`, and `payment_method` to limit possible values.
   - **CHECK**: Ensures `rating` is between 1 and 5 in the `reviews` table.
   - **Unique**: Ensures the `email` in the `users` table is unique.

4. **Indexes**: Indexes are created for frequently searched columns (like `email`, `property_id`, `user_id`, `booking_id`, etc.) to optimize query performance.
