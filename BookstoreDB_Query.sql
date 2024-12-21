-- Basic Queries
-- Retrieve all books along with their authors and categories
SELECT 
    b.BookID, b.Title, a.AuthorName, c.CategoryName
FROM 
    Books b
JOIN 
    Authors a ON b.AuthorID = a.AuthorID
JOIN 
    Categories c ON b.CategoryID = c.CategoryID;

-- Find books that are out of stock (StockQuantity = 0)
SELECT 
    BookID, Title, StockQuantity
FROM 
    Books
WHERE 
    StockQuantity = 0;

-- Aggregate Functions
-- Find the total revenue generated from all orders
SELECT 
    SUM(od.Quantity * b.Price) AS TotalRevenue
FROM 
    OrderDetails od
JOIN 
    Books b ON od.BookID = b.BookID;

-- Get the number of books available in each category
SELECT 
    c.CategoryName, COUNT(b.BookID) AS NumberOfBooks
FROM 
    Categories c
LEFT JOIN 
    Books b ON c.CategoryID = b.CategoryID
GROUP BY 
    c.CategoryName;

-- Joins

-- List all orders along with customer name, order date, book titles, and quantity ordered
SELECT 
    o.OrderID, o.CustomerName, o.OrderDate, b.Title, od.Quantity
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Books b ON od.BookID = b.BookID;


-- Subqueries
-- Find the most expensive book in the Fuction category
SELECT 
    TOP 1 b.BookID, b.Title, b.Price
FROM 
    Books b
WHERE 
    b.CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Fiction')
ORDER BY 
    b.Price DESC;

-- List customers who have ordered more than 5 books in a single order
SELECT 
    o.CustomerName
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    o.CustomerName, o.OrderID
HAVING 
    SUM(od.Quantity) > 5;

-- Advanced Queries
-- Identify authors whose books have generated revenue exceeding 500

SELECT 
    a.AuthorName, SUM(od.Quantity * b.Price) AS RevenueGenerated
FROM 
    Authors a
JOIN 
    Books b ON a.AuthorID = b.AuthorID
JOIN 
    OrderDetails od ON b.BookID = od.BookID
GROUP BY 
    a.AuthorName
HAVING 
    SUM(od.Quantity * b.Price) > 500;

-- Calculate the stock value (price × stock quantity) of all books and list the top 3 books by stock value

SELECT 
    b.BookID, b.Title, (b.Price * b.StockQuantity) AS StockValue
FROM 
    Books b
ORDER BY 
    StockValue DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


-- Stored Procedure
-- Stored Procedure: GetBooksByAuthor

CREATE PROCEDURE GetBooksByAuthor
    @AuthorID INT
AS
BEGIN
    SELECT 
        b.BookID, b.Title, b.Price, b.StockQuantity
    FROM 
        Books b
    WHERE 
        b.AuthorID = @AuthorID;
END;

-- execute 
EXEC GetBooksByAuthor @AuthorID = 2;


-- Views
-- Create a view TopSellingBooks that lists the top 5 books based on total quantity sold

CREATE VIEW TopSellingBooks AS
SELECT 
    b.BookID, b.Title, SUM(od.Quantity) AS TotalQuantitySold
FROM 
    Books b
JOIN 
    OrderDetails od ON b.BookID = od.BookID
GROUP BY 
    b.BookID, b.Title
ORDER BY 
    TotalQuantitySold DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY; 

-- See the content of the TopSellingBooks
SELECT * FROM TopSellingBooks;

-- Indexes
-- Create an index on the Books table for the Title column

CREATE NONCLUSTERED INDEX IDX_Books_Title
ON Books (Title);
