## Demo Instructions

To connect to our database, first log in to one of the cycle servers.

Then enter the following Bash script:

```bash
mysql -h mysql.eecs.ku.edu -u userID -p
```

## Credentials:

**Username**: `447s25_a542b289`

**Password**: `haehaiN3`

## Queries:

Below we have provided some queries to run in our database. Each query has a description of what it does followed by the code to run

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

# Book availability

# Books due soon

# Fine calculation for overdue books

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

