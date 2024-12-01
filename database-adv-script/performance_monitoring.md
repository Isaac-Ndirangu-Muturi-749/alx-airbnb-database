# Task 6: Monitor and Refine Database Performance

### Steps Taken
1. Used `EXPLAIN ANALYZE` or `SHOW PROFILE` to monitor query performance.
2. Added indexes and partitioned large tables.
3. Refactored queries for better execution plans.

### Results
Query execution times reduced significantly. Further suggestions include implementing materialized views for complex aggregations.


### Using `SHOW PROFILE` and `EXPLAIN ANALYZE`

1. **`SHOW PROFILE`:**
   - Run `SET profiling = 1;` to enable profiling.
   - Execute your query.
   - Run `SHOW PROFILE FOR QUERY <query_id>;` to view execution details (e.g., CPU, I/O usage).

2. **`EXPLAIN ANALYZE`:**
   - Prepend `EXPLAIN ANALYZE` to your query.
   - Analyzes the query execution plan and provides runtime statistics, such as execution time and rows scanned.
   - Use results to identify bottlenecks and optimize indexes, joins, or query structure.
