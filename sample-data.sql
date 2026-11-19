START TRANSACTION;

INSERT INTO Authors (AuthorID, AuthorName) VALUES
    (1, 'Jane Austen'),
    (2, 'Agatha Christie'),
    (3, 'George Orwell'),
    (4, 'Harper Lee'),
    (5, 'Arthur Conan Doyle'),
    (6, 'J. R. R. Tolkien'),
    (7, 'J. K. Rowling'),
    (8, 'C. S. Lewis'),
    (9, 'Mark Twain'),
    (10, 'Charles Dickens'),
    (11, 'F. Scott Fitzgerald'),
    (12, 'Mary Shelley'),
    (13, 'Bram Stoker'),
    (14, 'Lewis Carroll'),
    (15, 'J. D. Salinger');

INSERT INTO Books (BookID, Title, Genre, Price, AuthorID) VALUES
    (1, 'Pride and Prejudice', 'Fiction', 12.99, 1),
    (2, 'Murder on the Orient Express', 'Mystery', 14.50, 2),
    (3, '1984', 'Science Fiction', 16.99, 3),
    (4, 'To Kill a Mockingbird', 'Fiction', 13.25, 4),
    (5, 'The Hound of the Baskervilles', 'Mystery', 11.99, 5),
    (6, 'The Hobbit', 'Fantasy', 19.50, 6),
    (7, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 17.95, 7),
    (8, 'The Lion, the Witch and the Wardrobe', 'Fantasy', 15.75, 8),
    (9, 'Adventures of Huckleberry Finn', 'Fiction', 24.99, 9),
    (10, 'A Christmas Carol', 'Fiction', 21.00, 10),
    (11, 'The Great Gatsby', 'Fiction', 10.50, 11),
    (12, 'Frankenstein', 'Science Fiction', 18.25, 12),
    (13, 'Dracula', 'Horror', 14.99, 13),
    (14, 'Alice''s Adventures in Wonderland', 'Fantasy', 16.50, 14),
    (15, 'The Catcher in the Rye', 'Fiction', 20.00, 15);

INSERT INTO Customers (CustomerID, CustomerName, Email, Password) VALUES
    (1, 'Layla Reed', 'layla.reed@example.com', 'demo123'),
    (2, 'Ethan Cruz', 'ethan.cruz@example.com', 'demo123'),
    (3, 'Hana Yusuf', 'hana.yusuf@example.com', 'demo123'),
    (4, 'Noah James', 'noah.james@example.com', 'demo123'),
    (5, 'Mia Santos', 'mia.santos@example.com', 'demo123'),
    (6, 'Adam Saleh', 'adam.saleh@example.com', 'demo123'),
    (7, 'Sana Ali', 'sana.ali@example.com', 'demo123'),
    (8, 'Olivia Nguyen', 'olivia.nguyen@example.com', 'demo123'),
    (9, 'Theo Martin', 'theo.martin@example.com', 'demo123'),
    (10, 'Ava Brooks', 'ava.brooks@example.com', 'demo123'),
    (11, 'Lucas Park', 'lucas.park@example.com', 'demo123'),
    (12, 'Zoe Shah', 'zoe.shah@example.com', 'demo123'),
    (13, 'Jack Rivera', 'jack.rivera@example.com', 'demo123'),
    (14, 'Isabel Chen', 'isabel.chen@example.com', 'demo123'),
    (15, 'Liam Foster', 'liam.foster@example.com', 'demo123');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
    (1, 1, '2026-11-01', 12.99),
    (2, 2, '2026-11-02', 29.00),
    (3, 3, '2026-11-03', 16.99),
    (4, 4, '2026-11-04', 13.25),
    (5, 5, '2026-11-05', 35.97),
    (6, 6, '2026-11-06', 39.00),
    (7, 7, '2026-11-07', 17.95),
    (8, 8, '2026-11-08', 15.75),
    (9, 9, '2026-11-09', 49.98),
    (10, 10, '2026-11-10', 21.00),
    (11, 11, '2026-11-11', 10.50),
    (12, 12, '2026-11-12', 36.50),
    (13, 13, '2026-11-13', 14.99),
    (14, 14, '2026-11-14', 16.50),
    (15, 15, '2026-11-15', 40.00);

INSERT INTO OrderItems (OrderID, BookID, Quantity, Price) VALUES
    (1, 1, 1, 12.99),
    (2, 2, 2, 14.50),
    (3, 3, 1, 16.99),
    (4, 4, 1, 13.25),
    (5, 5, 3, 11.99),
    (6, 6, 2, 19.50),
    (7, 7, 1, 17.95),
    (8, 8, 1, 15.75),
    (9, 9, 2, 24.99),
    (10, 10, 1, 21.00),
    (11, 11, 1, 10.50),
    (12, 12, 2, 18.25),
    (13, 13, 1, 14.99),
    (14, 14, 1, 16.50),
    (15, 15, 2, 20.00);

INSERT INTO Reviews (ReviewID, CustomerID, BookID, Rating, ReviewText) VALUES
    (1, 1, 1, 5, 'A memorable story with great characters.'),
    (2, 2, 2, 4, 'The ending caught me by surprise.'),
    (3, 3, 3, 5, 'A thought-provoking story.'),
    (4, 4, 4, 4, 'The characters felt real.'),
    (5, 5, 5, 5, 'A great detective story.'),
    (6, 6, 6, 5, 'I enjoyed the adventure.'),
    (7, 7, 7, 3, 'A fun introduction to a magical world.'),
    (8, 8, 8, 4, 'An imaginative story.'),
    (9, 9, 9, 5, 'I enjoyed the journey down the river.'),
    (10, 10, 10, 4, 'A wonderful holiday story.'),
    (11, 11, 11, 3, 'The writing was beautiful.'),
    (12, 12, 12, 5, 'An interesting story about science and responsibility.'),
    (13, 13, 13, 4, 'A spooky and suspenseful read.'),
    (14, 14, 14, 4, 'A fun and unusual adventure.'),
    (15, 15, 15, 5, 'The narrator had a memorable voice.');

COMMIT;
