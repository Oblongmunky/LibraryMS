CREATE DATABASE db_LibraryMS

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL,
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50)
)

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50)
)

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE
)

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
)

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE,
	Number_Of_Copies INT NOT NULL
)

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50),
	Phone VARCHAR (50)
)

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
)

INSERT Books
	(BookID, Title, PublisherName)
	VALUES
	(101, 'The Lost Tribe', 'Picador USA'),
	(102, 'It', 'Viking'),
	(103, 'Jurassic Park', 'Alfred A. Knopf'),
	(104, 'The Magicians Nephew', 'The Bodley Head'),
	(105, 'Monster Hunter International', 'Baen Books'),
	(106, 'Monster Hunter Vendetta', 'Baen Books'),
	(107, 'Monster Hunter Alpha', 'Baen Books'),
	(108, 'Monster Hunter Legion', 'Baen Books'),
	(109, 'Monster Hunter Nemesis', 'Baen Books'),
	(110, 'Monster Hunter Siege', 'Baen Books'),
	(111, 'A Song of Ice and Fire', 'Bantam Books'),
	(112, 'The Hobbit', 'George Allen & Unwin'),
	(113, 'The Dunwich Horror', 'Weird Tales'),
	(114, 'A Christmas Carol', 'Chapman & Hall'),
	(115, 'The Murder of Roger Ackroyd', 'William Collins, Sons'),
	(116, 'Watchmen', 'Warner Books'),
	(117, 'To Kill a Mockingbird', 'J. B. Lippincott & Co.'),
	(118, 'The Outsiders', 'Dell Publishing'),
	(119, 'The Giver', 'Houghton Mifflin'),
	(120, 'The Hatchet', 'Kevin Lain')
	
INSERT Library_Branch
	(BranchID, BranchName, Address)
	VALUES
	(1, 'Sharpstown', '123 Sharpe AVE'),
	(2, 'Central', '321 Central ST'),
	(3, 'South', '456 South ST'),
	(4, 'North', '654 North AVE')

INSERT Book_Authors
	(BookID, AuthorName)
	VALUES
	(101, 'Mark Lee'),
	(102, 'Stephen King'),
	(103, 'Michael Crichton'),
	(104, 'C.S. Lewis'),
	(105, 'Larry Correia'),
	(106, 'Larry Correia'),
	(107, 'Larry Correia'),
	(108, 'Larry Correia'),
	(109, 'Larry Correia'),
	(110, 'Larry Correia'),
	(111, 'George R. R. Martin'),
	(112, 'J.R.R Tolkien'),
	(113, 'H.P. Lovecraft'),
	(114, 'Charles Dickens'),
	(115, 'Agatha Christie'),
	(116, 'Alan Moore'),
	(117, 'Harper Lee'),
	(118, 'S.E. Hinton'),
	(119, 'Lois Lowry'),
	(120, 'Gary Paulsen')

INSERT Borrower
	(CardNo, Name, Address, Phone)
	VALUES
	(1001, 'Jeremy', '123 3rd st', '333-333-3331'),
	(1002, 'Andrea', '123 4th st', '333-333-3332'),
	(1003, 'Harper', '123 5th st', '333-333-3333'),
	(1004, 'Chris', '456 1st ave', '333-444-4441'),
	(1005, 'Todd', '456 2nd ave', '333-444-4442'),
	(1006, 'Andrew', '456 3rd ave', '333-444-4443'),
	(1007, 'Kellen', '456 4th ave', '333-444-4444'),
	(1008, 'Steve', '789 5th ct', '333-555-5551'),
	(1009, 'Bob', '789 6th ct', '333-555-5552'),
	(1010, 'Johnnie', '789 7th ct', '333-555-5553'),
	(1011, 'Marla', '789 8th ct', '333-555-5554'),
	(1012, 'Glen', '789 9th ct', '333-555-5555')

INSERT Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(101, 1, 1002, '2018-08-20', '2018-09-17'),
	(112, 1, 1002, '2018-08-20', '2018-09-17'),
	(120, 1, 1002, '2018-08-20', '2018-09-17'),
	(101, 1, 1005, '2018-08-19', '2018-09-16'),
	(105, 1, 1005, '2018-08-19', '2018-09-16'),
	(110, 1, 1005, '2018-08-19', '2018-09-16'),
	(114, 1, 1005, '2018-08-19', '2018-09-16'),
	(117, 1, 1005, '2018-08-19', '2018-09-16'),
	(105, 1, 1008, '2018-08-13', '2018-09-10'),
	(106, 1, 1008, '2018-08-13', '2018-09-10'),
	(112, 1, 1008, '2018-08-13', '2018-09-10'),
	(114, 1, 1008, '2018-08-13', '2018-09-10'),
	(115, 1, 1008, '2018-08-13', '2018-09-10'),
	(120, 1, 1008, '2018-08-13', '2018-09-10'),
	(119, 2, 1012, '2018-08-05', '2018-09-02'),
	(113, 2, 1012, '2018-08-05', '2018-09-02'),
	(109, 2, 1012, '2018-08-05', '2018-09-02'),
	(102, 2, 1012, '2018-08-05', '2018-09-02'),
	(113, 2, 1009, '2018-08-01', '2018-08-29'),
	(107, 2, 1009, '2018-08-01', '2018-08-29'),
	(105, 2, 1009, '2018-08-01', '2018-08-29'),
	(112, 2, 1006, '2018-08-23', '2018-08-23'),
	(102, 2, 1006, '2018-08-23', '2018-08-23'),
	(107, 2, 1006, '2018-08-23', '2018-08-23'),
	(109, 2, 1004, '2018-08-17', '2018-09-14'),
	(103, 2, 1004, '2018-08-17', '2018-09-14'),
	(108, 2, 1004, '2018-08-17', '2018-09-14'),
	(101, 3, 1001, '2018-08-02', '2018-09-30'),
	(107, 3, 1001, '2018-08-02', '2018-09-30'),
	(113, 3, 1001, '2018-08-02', '2018-09-30'),
	(118, 3, 1001, '2018-08-02', '2018-09-30'),
	(111, 3, 1007, '2018-08-21', '2018-09-18'),
	(116, 3, 1007, '2018-08-21', '2018-09-18'),
	(104, 3, 1011, '2018-08-05', '2018-09-02'),
	(113, 3, 1011, '2018-08-05', '2018-09-02'),
	(114, 3, 1011, '2018-08-05', '2018-09-02'),
	(118, 3, 1011, '2018-08-05', '2018-09-02'),
	(120, 3, 1011, '2018-08-05', '2018-09-02'),
	(113, 4, 1011, '2018-08-08', '2018-09-05'),
	(115, 4, 1011, '2018-08-08', '2018-09-11'),
	(118, 4, 1007, '2018-08-20', '2018-09-05'),
	(116, 4, 1007, '2018-08-20', '2018-09-17'),
	(114, 4, 1007, '2018-08-20', '2018-09-17'),
	(110, 4, 1007, '2018-08-20', '2018-09-17'),
	(108, 4, 1007, '2018-08-20', '2018-09-17'),
	(101, 4, 1007, '2018-08-20', '2018-09-17'),
	(118, 4, 1004, '2018-08-14', '2018-09-11'),
	(116, 4, 1004, '2018-08-14', '2018-09-11'),
	(113, 4, 1004, '2018-08-14', '2018-09-11'),
	(108, 4, 1004, '2018-08-14', '2018-09-11')

INSERT Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Picador USA', '16365 James Madison Highway Gordonsville, VA 22942', '888-330-8477'),
	('Viking', 'New York City', '555-555-5551'),
	('Baen Books', '100 Front Street Riverside, NJ 08075', '800-223-2336'),
	('Alfred A. Knopf', 'New York City', 'N/A'),
	('The Bodley Head', 'London', 'N/A'),
	('Bantam Books', 'New York City', 'N/A'),
	('George Allen & Unwin', 'Crows Nest', 'N/A'),
	('Weird Tales', 'N/A', 'N/A'),
	('Chapman & Hall', 'United Kingdom', 'N/A'),
	('William Collins, Sons', 'Glasgow', 'N/A'),
	('Warner Books', 'New York City', 'N/A'),
	('J. B. Lippincott & Co.', 'Philadelphia', 'N/A'),
	('Dell Publishing', 'New York City', 'N/A'),
	('Houghton Mifflin', 'Boston', 'N/A'),
	('Kevin Lain', 'N/A', 'N/A')

INSERT Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	Values
	(120, 1, 10),
	(117, 1, 10),
	(115, 1, 10),
	(114, 1, 10),
	(112, 1, 10),
	(110, 1, 10),
	(106, 1, 10),
	(105, 1, 10),
	(102, 1, 10),
	(101, 1, 10),
	(119, 2, 10),
	(116, 2, 10),
	(113, 2, 10),
	(112, 2, 10),
	(109, 2, 10),
	(108, 2, 10),
	(107, 2, 10),
	(105, 2, 10),
	(103, 2, 10),
	(102, 2, 10),
	(120, 3, 10),
	(119, 3, 10),
	(118, 3, 10),
	(116, 3, 10),
	(114, 3, 10),
	(113, 3, 10),
	(111, 3, 10),
	(107, 3, 10),
	(104, 3, 10),
	(101, 3, 10),
	(120, 4, 10),
	(118, 4, 10),
	(116, 4, 10),
	(115, 4, 10),
	(114, 4, 10),
	(113, 4, 10),
	(110, 4, 10),
	(108, 4, 10),
	(105, 4, 10),
	(101, 4, 10)

USE db_LibraryMS;
GO

CREATE PROCEDURE usp_LibraryMS
AS
BEGIN

	SELECT c.Number_Of_Copies, b.Title, l.BranchName
	FROM Book_Copies c 
	INNER JOIN Books b ON b.BookId = c.BookId
	INNER JOIN Library_Branch l ON l.BranchId = c.BranchId
	WHERE l.BranchName = 'Sharpstown' AND b.Title = 'The Lost Tribe'
	

	SELECT c.Number_Of_Copies, b.Title, l.BranchName
	FROM Book_Copies c
	INNER JOIN Books b ON b.BookId = c.BookId
	INNER JOIN Library_Branch l ON l.BranchId = c.BranchId
	WHERE b.Title = 'The Lost Tribe'
	

	SELECT Name
	FROM Borrower b
	WHERE NOT EXISTS (SELECT *
	FROM Book_Loans l
	WHERE b.CardNo = l.CardNo)
	

	SELECT b.Title, r.Name, r.Address
	FROM Borrower r
	INNER JOIN Book_Loans bl ON r.CardNo = bl.CardNo
	INNER JOIN Books b ON b.BookId = bl.BookId
	INNER JOIN Library_Branch lb ON lb.BranchId = bl.BranchId
	WHERE lb.BranchName = 'Sharpstown' AND bl.DateDue = '08/10/17'
	;

	SELECT lb.BranchName, COUNT(*) AS 'Books Loaned'
	FROM Book_Loans bl, Library_Branch lb
	WHERE bl.BranchId = lb.BranchId
	GROUP BY lb.BranchName
	

	SELECT r.Name, r.Address, COUNT(*) AS 'Books Borrowed'
	FROM Borrower r
	INNER JOIN Book_Loans bl ON r.CardNo = bl.CardNo
	GROUP BY r.Name, r.address
	HAVING COUNT(*) > 5
	

	SELECT b.Title, c.Number_Of_Copies
	FROM Books b
	INNER JOIN Book_Copies c ON b.BookId = c.BookId
	INNER JOIN Book_Authors a ON b.BookId = a.BookId
	INNER JOIN Library_Branch lb ON c.BranchId = lb.BranchId
	WHERE a.AuthorName = 'Stephen King' AND lb.BranchName = 'Central'
	
END
