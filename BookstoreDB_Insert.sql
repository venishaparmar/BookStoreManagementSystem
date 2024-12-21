-- Insert sample data into Authors
INSERT INTO Authors (AuthorName) VALUES 
('Ruskin Bond'),
('Shashi Tharoor'),
('Sudha Murty'),
('Khushwant Singh'),
('Salman Rushdie'),
('APJ Abdul Kalam');

-- Insert sample data into Categories
INSERT INTO Categories (CategoryName) VALUES 
('Thriller'),
('Politics'),
('Children'),
('Humor'),
('Travel'),
('Self-Help');

-- Insert sample data into Books
INSERT INTO Books (Title, AuthorID, CategoryID, Price, StockQuantity) VALUES 
('The Blue Umbrella', 1, 3, 150.00, 30),
('The Great Indian Novel', 2, 2, 400.00, 10),
('Wise and Otherwise', 3, 6, 250.00, 25),
('Train to Pakistan', 4, 1, 320.00, 15),
('Midnight Children', 5, 1, 500.00, 5),
('You Are Born Blossom', 6, 6, 450.00, 20),
('A Flight Pigeons', 1, 3, 200.00, 18),
('Why I Am a Hindu', 2, 2, 350.00, 12),
('Grandma Bag of Stories', 3, 3, 180.00, 40),
('The Company of Women', 4, 4, 300.00, 8),
('Ignited Minds', 6, 6, 400.00, 0);

-- Insert sample data into Orders
INSERT INTO Orders (CustomerName, OrderDate) VALUES 
('Amit Mehta', '2024-12-20'),
('Kavita Desai', '2024-12-19'),
('Ravi Verma', '2024-12-16'),
('Sneha Iyer', '2024-12-22');

-- Insert sample data into OrderDetails
INSERT INTO OrderDetails (OrderID, BookID, Quantity) VALUES 
(1, 1, 2),  -- Amit Mehta ordered 2 copies of The Blue Umbrella
(1, 5, 1),  -- Amit Mehta ordered 1 copy of Midnight's Children
(2, 2, 3),  -- Kavita Desai ordered 3 copies of The Great Indian Novel
(2, 8, 2),  -- Kavita Desai ordered 2 copies of Why I Am a Hindu
(3, 4, 1),  -- Ravi Verma ordered 1 copy of Train to Pakistan
(3, 9, 2),  -- Ravi Verma ordered 2 copies of Grandma's Bag of Stories
(4, 6, 1),  -- Sneha Iyer ordered 1 copy of You Are Born to Blossom
(4, 8, 3),  -- Sneha Iyer ordered 3 copies of Why I Am a Hindu
(4, 1, 1);  -- Sneha Iyer ordered 1 copy of The Blue Umbrella
