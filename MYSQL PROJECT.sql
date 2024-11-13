CREATE DATABASE Library;
USE Library;

-- Branch Table:
CREATE TABLE Branch( Branch_no INT PRIMARY KEY, Manager_id INT, Branch_address VARCHAR(100), Contact_no VARCHAR(15));

INSERT INTO Branch (Branch_no, Manager_id, Branch_address, Contact_no) VALUES
(101, 1, '123 Main St, Springfield', '98765432178'),
(102, 2, '456 Elm St, Shelbyville', '9123456783'),
(103, 3, '789 Oak St, Capital City', '9987654312'),
(104, 4, '321 Pine St, North Haverbrook', '9765432144'),
(105, 5, '654 Cedar St, Ogdenville', '9876543212'),
(106, 6, '147 Birch St, West Springfield', '99871234554'),
(107, 7, '258 Walnut St, Monroeville', '9876432188'),
(108, 8, '369 Maple St, Brockway', '9123987654'),
(109, 9, '147 Sycamore St, North Haverbrook', '9912345678'),
(110, 10, '789 Hickory St, West Springfield', '9845678902');

SELECT * FROM Branch;

CREATE TABLE  Employee (Emp_id Varchar(20) Primary key, Emp_name Varchar(40), Position Varchar(40), Salary bigint(20), Branch_no INT,FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice Johnson', 'Manager', 60000, 101),
(2, 'Bob Smith', 'Librarian', 45000, 102),
(3, 'Charlie Brown', 'Assistant Librarian', 35000, 103),
(4, 'David Wright', 'Librarian', 48000, 104),
(5, 'Emily Davis', 'Manager', 62000, 105),
(6, 'Frank Harris', 'Librarian', 43000, 106),
(7, 'Grace Wilson', 'Assistant Librarian', 34000, 107),
(8, 'Hannah Clark', 'Librarian', 47000, 108),
(9, 'Ian Walker', 'Manager', 61000, 109),
(10, 'Jack Lee', 'Librarian', 44000, 110);

SELECT* FROM Employee ;

CREATE TABLE Books (ISBN VARCHAR(20) PRIMARY KEY, Book_title VARCHAR(50), Category VARCHAR(30), Rental_price BIGINT (20), STATUS VARCHAR(3), Author VARCHAR(30), Publisher VARCHAR(30));

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-0-123456-47-2', 'The Great Gatsby', 'Fiction', 10.50, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-1-234567-89-3', '1984', 'Dystopian', 25.00, 'no', 'George Orwell', 'Secker & Warburg'),
('978-2-345678-91-4', 'To Kill a Mockingbird', 'Fiction', 8.75, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-3-456789-12-5', 'Moby Dick', 'Adventure', 26.50, 'yes', 'Herman Melville', 'Harper & Brothers'),
('978-4-567891-23-6', 'War and Peace', 'History', 12.00, 'no', 'Leo Tolstoy', 'The Russian Messenger'),
('978-5-678912-34-7', 'Pride and Prejudice', 'Romance', 8.00, 'yes', 'Jane Austen', 'T. Egerton'),
('978-6-789123-45-8', 'The Catcher in the Rye', 'Fiction', 7.25, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-7-891234-56-9', 'The Hobbit', 'Fantasy', 30.00, 'yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
('978-8-912345-67-0', 'Crime and Punishment', 'Psychological Fiction', 9.50, 'no', 'Fyodor Dostoevsky', 'The Russian Messenger'),
('978-9-123456-78-1', 'The Odyssey', 'Epic', 11.00, 'yes', 'Homer', 'Penguin Classics');

CREATE  TABLE Customer(Customer_id VARCHAR(20) PRIMARY KEY, Customer_name VARCHAR(30), Customer_address VARCHAR(40));
ALTER TABLE Customer ADD Reg_date DATE;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'John Doe', '555 Apple St, Springfield', '2021-05-12'),
(2, 'Jane Smith', '123 Banana St, Shelbyville', '2020-11-25'),
(3, 'Michael Johnson', '789 Cherry St, Capital City', '2021-03-14'),
(4, 'Sarah Williams', '456 Pear St, North Haverbrook', '2022-01-30'),
(5, 'David Brown', '321 Orange St, Ogdenville', '2023-06-18'),
(6, 'Emily Clark', '258 Pine St, West Springfield', '2023-02-22'),
(7, 'Jessica White', '147 Birch St, Brockway', '2021-09-10'),
(8, 'Robert Harris', '654 Maple St, Springfield', '2022-12-01'),
(9, 'Daniel Walker', '369 Cedar St, Shelbyville', '2022-07-15'),
(10, 'Sophia Green', '147 Elm St, Capital City', '2020-08-05');

SELECT* FROM Books;
SELECT * FROM Customer;

CREATE  TABLE IssueStatus (Issue_id VARCHAR(20) PRIMARY KEY, Issued_cust VARCHAR(30), FOREIGN KEY(Issued_cust) REFERENCES Customer(Customer_id),Issued_book_name VARCHAR(50), issued_date DATE, Isbn_book VARCHAR(30), FOREIGN KEY(Isbn_book) REFERENCES Books(ISBN) );

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issued_date, Isbn_book) VALUES
(1, 1, 'The Great Gatsby', '2023-07-01', '978-0-123456-47-2'),
(2, 2, '1984', '2023-06-15', '978-1-234567-89-3'),
(3, 3, 'To Kill a Mockingbird', '2023-05-20', '978-2-345678-91-4'),
(4, 4, 'Moby Dick', '2023-04-10', '978-3-456789-12-5'),
(5, 5, 'War and Peace', '2023-03-25', '978-4-567891-23-6'),
(6, 6, 'Pride and Prejudice', '2023-02-18', '978-5-678912-34-7'),
(7, 7, 'The Catcher in the Rye', '2023-01-30', '978-6-789123-45-8'),
(8, 8, 'The Hobbit', '2023-07-10', '978-7-891234-56-9'),
(9, 9, 'Crime and Punishment', '2023-06-02', '978-8-912345-67-0'),
(10, 10, 'The Odyssey', '2023-05-15', '978-9-123456-78-1');

 SELECT * FROM IssueStatus;

CREATE TABLE ReturnStatus(Return_id VARCHAR(30) PRIMARY KEY, Return_cust VARCHAR(30), Return_book_name VARCHAR(50), Return_date DATE, Isbn_book2 VARCHAR(40), FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN));

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'The Great Gatsby', '2023-08-01', '978-0-123456-47-2'),
(2, 2, '1984', '2023-07-20', '978-1-234567-89-3'),
(3, 3, 'To Kill a Mockingbird', '2023-06-30', '978-2-345678-91-4'),
(4, 4, 'Moby Dick', '2023-06-05', '978-3-456789-12-5'),
(5, 5, 'War and Peace', '2023-05-15', '978-4-567891-23-6'),
(6, 6, 'Pride and Prejudice', '2023-04-20', '978-5-678912-34-7'),
(7, 7, 'The Catcher in the Rye', '2023-03-18', '978-6-789123-45-8'),
(8, 8, 'The Hobbit', '2023-08-10', '978-7-891234-56-9'),
(9, 9, 'Crime and Punishment', '2023-07-01', '978-8-912345-67-0'),
(10, 10, 'The Odyssey', '2023-06-10', '978-9-123456-78-1');

SELECT * FROM ReturnStatus;


-- 1 

SELECT Book_title,Category,Rental_price FROM Books WHERE STATUS="yes";

-- 2 

SELECT Emp_name, Salary FROM Employee ORDER BY salary DESC;

-- 3 

SELECT Books.Book_title, Customer.Customer_name FROM Books 
JOIN Issuestatus ON Books.Book_title=IssueStatus.Issued_book_name
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4  

SELECT Category, count(*) AS Total_Count FROM  Books GROUP BY Category;

-- 5
SELECT Emp_name,Position FROM  Employee WHERE salary>50000;
-- 6. 
SELECT Customer.Customer_name
FROM Customer
LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE Customer.Reg_date < '2022-01-01'
AND IssueStatus.Issued_cust IS NULL;


-- 7 

SELECT Branch_no,count(Emp_id)  FROM Employee GROUP BY Branch_no;

-- 8  

SELECT Customer_name FROM Customer WHERE Customer_Id IN (SELECT Issued_cust FROM IssueStatus WHERE Issued_date BETWEEN '2023-06-01' AND '2023-06-30');

-- 
SELECT *FROM Customer
WHERE Customer_Id IN (
    SELECT Issued_cust
    FROM IssueStatus
    WHERE Issued_date BETWEEN '2023-06-01' AND '2023-06-30'
);

-- 9
SELECT Book_title FROM Books WHERE Category LIKE '%history%' ;

-- 10
SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(Emp_Id) > 5;

-- 11
SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Employee.Position ='Manager';
-- 12
SELECT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price  > 25;