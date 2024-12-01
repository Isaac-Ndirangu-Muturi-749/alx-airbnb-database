# Task 3: Implement Indexes for Optimization

### Indexes Created
1. **Users Table**: `email` column.
2. **Bookings Table**: `start_date` column.
3. **Properties Table**: `location` column.

### Performance Improvement
Indexes were added on frequently used columns in WHERE, JOIN, and ORDER BY clauses. This improved query performance as validated by `EXPLAIN ANALYZE`.
