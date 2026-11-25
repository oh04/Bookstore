-- Demo password: demo123. Stored as salt:hash using PBKDF2-SHA256 (600,000 iterations).
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
    (1, 'Layla Reed', 'layla.reed@example.com', 'c6a3dbdd11d0b768fb8c357730b31742:287a0ac6158be30d1f96896e3550a393148899207992ef9802bf2071446e8783'),
    (2, 'Ethan Cruz', 'ethan.cruz@example.com', '30ee57351827e3d48c900f2a9e3980f6:383e9af1161850dd5b5f50f225e5f29cc10817d53a6f3ca6df7c1ba99740687e'),
    (3, 'Hana Yusuf', 'hana.yusuf@example.com', 'b2c50e1aa757464f18e300397e989175:ecd5de33544c381c331c3d62e84d3024c673777a8cd5b06d1e81a50dc2afcb7e'),
    (4, 'Noah James', 'noah.james@example.com', 'ecfea66981e21cda3aaf7eaf81adb6a9:b62a3118bbd11091f920946399d20f9e87649a9feb52cd64a3f9ed7cc89900cc'),
    (5, 'Mia Santos', 'mia.santos@example.com', '4c83f6a195319cebc433355b33853064:63a3abc1f24a1a27b065f8f95525039676b5b10a6ff2be3d1754d4b68fde3c91'),
    (6, 'Adam Saleh', 'adam.saleh@example.com', 'f850bbc91aa18bd1ac22ae31e32e5781:ea17756581a3506af1d8b88a79ca11612625715ee0a2343a3ce810704f598da9'),
    (7, 'Sana Ali', 'sana.ali@example.com', '33654cefb4209a84578103bc4e96a351:afdf5d151bc85eabfe5042b1ac9ba68883d2a57517ccae9f779af39147d7e9ad'),
    (8, 'Olivia Nguyen', 'olivia.nguyen@example.com', '4915df00f002894389fbe059ff2dc82c:5b746386bc8a347d0d8fe586a9ef4613f19bf670534ea2399a6fa62d1e42116b'),
    (9, 'Theo Martin', 'theo.martin@example.com', '74c6194400544344b49bcdbaeea83f57:3e34da81cdabb233b90e7cf7f4e74c1cc618c2570bf2aca3e2b9e0ac46f1f841'),
    (10, 'Ava Brooks', 'ava.brooks@example.com', '639088fb8c1b7de7afebce3757196cbe:7252be0bbbff49a9b47d6208ade697fa4d972207d3c7b41dd546195052cae905'),
    (11, 'Lucas Park', 'lucas.park@example.com', '329ead1b6294ae3460a55e63537993f0:ea4f3f912cc681ea9712c241757b0fa150261bf05ed378e378371f7967c4357a'),
    (12, 'Zoe Shah', 'zoe.shah@example.com', '476d5e8b6946454d2949deb26162eb67:7540d930989ef034b9e024195fe90679a8e1b3618e8f18f59a610e357a8dac77'),
    (13, 'Jack Rivera', 'jack.rivera@example.com', '55b944054392bb16dae04cd1a4064257:dc3e42cab38d3079344d2a8bbba82c2f1336c228ad1dd4749f441ac191208681'),
    (14, 'Isabel Chen', 'isabel.chen@example.com', '93a16c1c2d6af767a062cc8e1496b6d8:cbdf9c767e5fc1ba3f8f841b85c15b7186f6b434467cebc1a4f3553f86d41fbc'),
    (15, 'Liam Foster', 'liam.foster@example.com', '67354c1fb99340d457c4396772fbc9b3:d51416749f1ac4962e154d84546b7df366c88a3c28333f3aa40bf961ff87b896');

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
