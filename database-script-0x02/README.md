The SQL script (`seed.sql`) populates the database with sample data for the Airbnb database, ensuring the data reflects real-world usage:

### Key Points in the `seed.sql` file:
1. **Users**: Four sample users are inserted—two guests, one host, and one admin. Each user has a unique UUID, name, email, password hash, role, and creation timestamp.

2. **Properties**: Two properties are created for the host (Jane Smith) with distinct names, locations, prices, and creation timestamps.

3. **Bookings**: Two sample bookings are inserted, each referencing the properties and users. Each booking includes a start date, end date, total price, booking status (confirmed, pending), and creation timestamp.

4. **Payments**: Two payments are added, each linked to a booking. Different payment methods (credit card, PayPal) are included for variety.

5. **Reviews**: Two reviews are added for the properties, with ratings (1-5), comments, and timestamps.

6. **Messages**: Two sample messages are inserted to simulate communication between users (e.g., guests asking hosts questions or confirming bookings).
