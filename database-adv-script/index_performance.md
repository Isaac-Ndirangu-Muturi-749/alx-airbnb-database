# Task 3: Implement Indexes for Optimization

### Indexes Created
1. **Users Table**: `email` column.
2. **Bookings Table**: `start_date` column.
3. **Properties Table**: `location` column.

### Performance Improvement
Indexes were added on frequently used columns in WHERE, JOIN, and ORDER BY clauses. This improved query performance as validated by `EXPLAIN ANALYZE`.

### Using `EXPLAIN ANALYZE` in SQL

`EXPLAIN ANALYZE` is used to analyze query execution by showing the query plan and the time taken for each step. Here's how to use it effectively:

1. **Write the Query**: Compose the SQL query you want to analyze.
2. **Add `EXPLAIN ANALYZE`**: Prefix the query with `EXPLAIN ANALYZE`.
   Example:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM bookings WHERE start_date > '2024-01-01';
   ```
3. **Execute the Query**: Run the command in your database system (e.g., PostgreSQL).
4. **Interpret Results**: Review the output, which shows:
   - Execution steps (e.g., scans, joins).
   - Time taken at each step.
   - Potential bottlenecks (e.g., sequential scans on large tables).

### Common Optimizations Based on Results:
- Add indexes to reduce scan times.
- Refactor joins or subqueries.
- Partition large tables for frequent range queries.

This tool helps identify and resolve performance issues in SQL queries.
