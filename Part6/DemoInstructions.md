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

# Never-late clients

# Frequent borrowers of a specific genre

<!-- Liam -->

# Most popular author in the last month

# Exceeded borrowing limits


<!--
Jorge
Sam

More report ideas are in canvas -> databases -> files -> project

-->
## Reports:

Below we have provided two report queries for our database. These reports have a description of what it does followed by the code to run

# Detect books with zero borrows

# Calculate average book age

