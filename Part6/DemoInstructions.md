## Demo Instructions

To connect to our database, first log in to one of the cycle servers.

Then enter the following Bash script:

```bash
mysql -h mysql.eecs.ku.edu -u 447s25_a542b289 -p
```

## Credentials:

**Password**: `haehaiN3`

## Enter our DB

`Use 447s25_a542b289`

## Queries:

Below we have provided some queries to run in our database. Each query has a description of what it does followed by the code to run

<!-- Aiden -->

# List all books by a specific author
```SQL
-- Replace 'Author Name' with the desired author
SELECT b.Title, b.ISBN, b.PublicationDate
FROM Book AS b
JOIN Creates AS c ON b.ItemID = c.ItemID
JOIN Author AS a ON c.AuthorID = a.AuthorID
WHERE a.Name = 'Author Name';
```

# Find books by publication year
```SQL
-- Replace 2023 with the desired publication year
SELECT b.Title, b.ISBN, b.PublicationDate
FROM Book AS b
WHERE YEAR(b.PublicationDate) = 2023;
```

# Check membership status for a specific client
```SQL
-- Replace 'ClientID' with the desired client ID
SELECT c.ClientID,
       c.Name,
       c.AccountStatus,
       c.MembershipType,
       m.BorrowingLimit,
       m.LateFee
FROM Client AS c
LEFT JOIN Membership AS m
  ON c.MembershipType = m.MembershipType
WHERE c.ClientID = 'ClientID';
```

<!-- Daniel -->

# Book availability
```SQL
-- List each book and how many copies are currently available
SELECT 
  b.Title,
  b.ISBN,
  b.CopiesAvailable
FROM Book AS b;
```

# Books due soon
```SQL
-- Show checkouts due in the next 7 days that haven’t been returned
SELECT 
  t.TransactionID,
  b.Title,
  b.ISBN,
  t.ClientID,
  t.DueDate
FROM `Transaction` AS t
JOIN Book AS b
  ON t.ItemID = b.ItemID
WHERE t.ReturnDate IS NULL
  AND t.DueDate BETWEEN CURDATE() 
                    AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);
```

# Fine calculation for overdue books
```SQL
-- Calculate accrued fines for all currently overdue items
SELECT 
  t.TransactionID,
  b.Title,
  t.ClientID,
  DATEDIFF(CURDATE(), t.DueDate)
    * COALESCE(m.LateFee, 0) AS FineAccrued
FROM `Transaction` AS t
JOIN Book AS b
  ON t.ItemID = b.ItemID
JOIN Client AS c
  ON t.ClientID = c.ClientID
LEFT JOIN Membership AS m
  ON c.MembershipType = m.MembershipType
WHERE t.ReturnDate IS NULL
  AND t.DueDate < CURDATE();
```

<!-- Jack -->

# Members with overdue books and related titles
```SQL
-- This lists clients with unreturned books whose due dates have already passed, including the book titles and due dates.
SELECT 
  c.ClientID,
  c.Name,
  b.Title,
  t.DueDate
FROM `Transaction` AS t
JOIN Client AS c ON t.ClientID = c.ClientID
JOIN Book AS b ON t.ItemID = b.ItemID
WHERE t.ReturnDate IS NULL
  AND t.DueDate < CURDATE();
```


# Never-late clients
```SQL
-- This selects clients who have never had an overdue transaction (either currently overdue or at the time of return, depending on how you'd track late returns).
SELECT 
  c.ClientID,
  c.Name
FROM Client AS c
WHERE NOT EXISTS (
  SELECT 1
  FROM `Transaction` AS t
  WHERE t.ClientID = c.ClientID
    AND t.ReturnDate IS NULL
    AND t.DueDate < CURDATE()
);
```

# Frequent borrowers of a specific genre
```SQL
-- This query counts how many times each client has borrowed a book of a specific genre. You can change 'Fantasy' to any genre you want to analyze.
SELECT 
  c.ClientID,
  c.Name,
  COUNT(*) AS TimesBorrowed
FROM `Transaction` AS t
JOIN Client AS c ON t.ClientID = c.ClientID
JOIN Book AS b ON t.ItemID = b.ItemID
WHERE b.Genre = 'Fantasy'
GROUP BY c.ClientID, c.Name
ORDER BY TimesBorrowed DESC;
```

<!-- Liam -->

# Most popular author in the last month
-- Finds the author whose books were borrowed the most times in the past month.
SELECT 
  a.AuthorID,
  a.Name AS AuthorName,
  COUNT(t.TransactionID) AS TimesBorrowed
FROM `Transaction` AS t
JOIN Book AS b ON t.ItemID = b.ItemID
JOIN Creates AS c ON b.ItemID = c.ItemID
JOIN Author AS a ON c.AuthorID = a.AuthorID
WHERE t.CheckoutDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY a.AuthorID, a.Name
ORDER BY TimesBorrowed DESC
LIMIT 1;

# Exceeded borrowing limits
--Lists clients who have more current checkouts than their membership allows
SELECT 
  c.ClientID,
  c.Name,
  COUNT(t.TransactionID) AS CurrentlyBorrowed,
  m.BorrowingLimit
FROM Client AS c
JOIN Membership AS m ON c.MembershipType = m.MembershipType
JOIN `Transaction` AS t ON c.ClientID = t.ClientID
WHERE t.ReturnDate IS NULL
GROUP BY c.ClientID, c.Name, m.BorrowingLimit
HAVING COUNT(t.TransactionID) > m.BorrowingLimit;


<!--
Jorge
Sam

More report ideas are in canvas -> databases -> files -> project

-->
## Reports:

Below we have provided two report queries for our database. These reports have a description of what it does followed by the code to run

# Detect books with zero borrows
SELECT
  b.ItemID,
  b.Title,
  b.ISBN,
  b.PublicationDate
FROM
  Book AS b
LEFT JOIN
  `Transaction` AS t
  ON b.ItemID = t.ItemID
WHERE
  t.TransactionID IS NULL;

# Calculate average book age

-- 2. Calculate average book age (in years, to two decimal places)
SELECT
  ROUND(
    AVG(
      DATEDIFF(CURDATE(), PublicationDate) / 365.0
    ),
    2
  ) AS AverageBookAgeYears
FROM
  Book;


