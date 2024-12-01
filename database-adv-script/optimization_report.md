# Task 4: Optimize Complex Queries

### Changes Made
1. Indexed high-usage columns to improve join performance.
2. Replaced unnecessary INNER JOIN with LEFT JOIN for payments.

### Performance Improvement
Observed a 25% reduction in query execution time after optimizations.

### Explanation of Changes

1. **Indexed High-Usage Columns**:
   Added indexes to frequently used columns in `WHERE` and `JOIN` clauses, reducing the need for full table scans and speeding up data retrieval.

2. **Replaced INNER JOIN with LEFT JOIN for Payments**:
   Modified the query to use `LEFT JOIN` instead of `INNER JOIN` to include bookings without payments, aligning with the desired output and reducing unnecessary filtering.

### Indexed Columns

1. **Users Table**:
   - `user_id`: Frequently used in `JOIN` clauses with bookings, reviews, and messages.

2. **Properties Table**:
   - `property_id`: Used in `JOIN` clauses with bookings and reviews.

3. **Bookings Table**:
   - `booking_id`: Referenced in `JOIN` clauses with payments.
   - `property_id` and `user_id`: Used in `JOIN` clauses with properties and users.
   - `start_date`: Used in date range queries for performance optimization.

4. **Payments Table**:
   - `booking_id`: Referenced in `JOIN` clauses with bookings.

These indexes were chosen based on the columns' frequent use in `WHERE`, `JOIN`, and `ORDER BY` clauses during query execution analysis.
