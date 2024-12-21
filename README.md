# BookStoreManagementSystem
 MS_SQL_Assessment_Phase-1
# SQL Take-Home Tasks: File Structure and Approach

## File Structure

1. **Database Design and Creation**
   - **File Name**: `BookstoreDB_Create.sql`
   - **Purpose**: Contains scripts to set up the database, define all necessary tables, and establish relationships and constraints.

2. **Data Insertion**
   - **File Name**: `BookstoreDB_Insert.sql`
   - **Purpose**: Includes scripts to populate the tables with sample data.

3. **Querying and Analysis**
   - **File Name**: `BookstoreDB_Query.sql`
   - **Purpose**: Contains SQL queries for various tasks, ranging from basic data retrieval to advanced operations like joins, subqueries, views, indexes, and stored procedures.

---

## Approach for Each Task

### 1. Basic Queries
- **Goal**: Perform straightforward operations to retrieve and filter data.
- **Approach**:
  - Used `JOIN` to fetch related data from multiple tables.
  - Applied `WHERE` clauses to filter data effectively (e.g., finding books that are out of stock).
  - Focused on making the queries simple and intuitive for easy understanding.
- **Examples**:
  - Retrieve all books with their authors and categories.
  - Find books where the stock quantity is zero.

### 2. Aggregate Functions
- **Goal**: Summarize data using mathematical functions.
- **Approach**:
  - Utilized functions like `SUM`, `COUNT`, and `ROUND`.
  - Grouped data using `GROUP BY` for analysis per category or author.
- **Examples**:
  - Calculate total revenue by multiplying quantity and price.
  - Count the number of books available in each category.

### 3. Joins
- **Goal**: Combine related records from different tables.
- **Approach**:
  - Used `INNER JOIN` for standard relationships (e.g., Orders and Books).
  - Applied `LEFT JOIN` to include data even if there were no matches (e.g., categories with no books).
- **Example**:
  - List all orders with customer names, order dates, book titles, and quantities.

### 4. Subqueries
- **Goal**: Use embedded queries for dynamic and dependent results.
- **Approach**:
  - Designed nested `SELECT` statements to retrieve targeted data, such as the most expensive book in a category.
  - Used subqueries for dynamic conditions like fetching a `CategoryID` based on category name.
- **Example**:
  - Find the most expensive book in a specific category.

### 5. Advanced Queries
- **Goal**: Handle complex tasks like revenue breakdowns and multi-step operations.
- **Approach**:
  - Used `HAVING` to filter groups after aggregation.
  - Combined calculations for tasks such as determining revenue per author.
- **Examples**:
  - Identify authors generating revenue above a certain threshold.
  - List books in descending order of their stock value.

### 6. Stored Procedures
- **Goal**: Create reusable database functions for dynamic operations.
- **Approach**:
  - Built procedures like `GetBooksByAuthor` with optional parameters to allow flexibility.
  - Handled `NULL` values gracefully to retrieve all books when no author is specified.
- **Example**:
  - Dynamically fetch books by supplying an `AuthorID`.

### 7. Views
- **Goal**: Simplify complex queries by creating pre-defined virtual tables.
- **Approach**:
  - Defined views such as `TopSellingBooks` to list the top 5 books by total sales.
  - Used aggregate functions and proper ordering to ensure the view stays updated.
- **Example**:
  - Generate a report of the most frequently sold books using the view.

### 8. Indexes
- **Goal**: Improve query performance for frequent searches.
- **Approach**:
  - Added a non-clustered index on the `Title` column in the Books table to optimize searches.
  - Ensured unique constraints where necessary to maintain data integrity.
- **Example**:
  - Speed up searches for book titles with the index.

---

## Additional Considerations

### Error Handling
- All scripts were tested with sample data to ensure they run without errors.
- Special attention was given to handle `NULL` values effectively in queries and procedures.

### Data Integrity
- Foreign key dependencies were carefully managed to prevent issues during data insertion.
- Ensured no orphan records by following proper insert and delete practices.

### Scalability
- Modular SQL scripts were used to make it easy to update or expand the database structure.
- Strategic indexing ensures performance remains optimal even with growing data.

---

## Tools Used
- **Database System**: MySQL Server
- **IDE**: SQL Server Management Studio (SSMS)
- **Testing**: Verified with sample data and real-time execution.
