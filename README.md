# Database Ninjas BookStore Database Project

## Overview

This project involves the design and implementation of a MySQL database system for a BookStore. As database administrators, we have created a structured relational database to efficiently store and manage the BookStore's data, including books, authors, customers, orders, shipping information, and more.

## Project Objectives

- Create a comprehensive MySQL database for BookStore operations
- Design and implement table schemas with appropriate data types
- Establish relationships between entities
- Set up user groups and roles to control database access
- Enable efficient data retrieval and analysis

## Tools and Technologies Used

- **MySQL**: Used for building and managing the database
- **Draw.io**: Used for visualizing the database schema and relationships

## Database Schema

Our database consists of 15 interconnected tables:

1. **book**: Stores information about each book in the store
2. **book_author**: Junction table to manage the many-to-many relationship between books and authors
3. **author**: Contains author information
4. **book_language**: Lists possible languages of books
5. **publisher**: Records publisher information
6. **customer**: Stores customer details
7. **customer_address**: Manages multiple addresses for customers
8. **address_status**: Lists statuses for addresses (e.g., current, old)
9. **address**: Contains detailed address information
10. **country**: Lists countries for address records
11. **cust_order**: Stores order information
12. **order_line**: Contains details about books in each order
13. **shipping_method**: Lists available shipping methods
14. **order_history**: Records the history of order statuses
15. **order_status**: Lists possible order statuses

## Entity Relationship Diagram (ERD)

We've created a comprehensive ERD using Draw.io to visualize the database structure and relationships between tables. The diagram illustrates the primary and foreign key connections, showing how data flows through the system.

## Implementation Steps

1. **Database Design**:
   - Identified entities and attributes
   - Established relationships between entities
   - Determined appropriate data types and constraints

2. **Database Creation**:
   - Created the BookStore database in MySQL
   - Implemented tables according to the schema design
   - Added primary and foreign key constraints

3. **User Management**:
   - Set up user groups with appropriate permission levels
   - Implemented security best practices

4. **Testing**:
   - Tested the database with sample queries
   - Verified data integrity and relationships

## Repository Structure

- `ERD/`: Contains the database schema diagram
- `SQL/`: Contains SQL scripts for:
  - Database creation
  - Table creation
  - Sample data insertion
  - User/role setup
- `Documentation/`: Additional documentation and resources

## Usage

To set up the database:

1. Run the database creation script:
   ```sql
   source SQL/create_database.sql
   ```

2. Create the tables:
   ```sql
   source SQL/create_tables.sql
   ```

3. Add sample data (optional):
   ```sql
   source SQL/insert_sample_data.sql
   ```

4. Configure users and permissions:
   ```sql
   source SQL/setup_users.sql
   ```

## Contributors

- Angela Gichane.
- Catherine Zena.
- Faith Kendi

## License

This project is submitted as coursework for Database Design & Programming with SQL.
