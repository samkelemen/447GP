## Entities

Item

- ItemID (foreign key & primary key [1, 1]) - VARCHAR
    - Here to ensure all the IDs are unique across books, digital media, and magazines

Book

- Attributes
    - Genre - VARCHAR
    - ISBN - VARCHAR(13)
    - PublicationDate - DATE
    - Title - VARCHAR
    - CopiesAvailable - INT (CopiesAvailable >= 0)

DigitalMedia

- Attributes
    - MediaID - VARCHAR
    - PublicationDate - DATE
    - Title - VARCHAR
    - CopiesAvailable - INT (CopiesAvailable >= 0)
    - Format - VARCHAR

Magazine

- Attributes
    - MagazineID - VARCHAR
    - PublicationDate - DATE
    - Title - VARCHAR
    - CopiesAvailable INT (CopiesAvailable >= 0)
    - IssueNumber - VARCHAR

Client

- Attributes
    - ClientID - VARCHAR
    - Email - VARCHAR
    - Name - VARCHAR
    - AccountStatus - BOOLEAN

Author

- Attributes
    - AuthorID - VARCHAR
    - Name - VARCHAR

Publisher

- Attributes
    - PublisherID - VARCHAR
    - Name - VARCHAR

Notification

- Attributes
    - SendDate - DATE
    - Message - VARCHAR
    - NotificationID - VARCHAR
    - ClientID - VARCHAR (foreign key [1, N])

Transaction

- Attributes
    - TransactionID - VARCHAR
    - LateFee - DECIMAL(5, 2)
    - DueDate - DATE
    - CheckoutDate - DATE
    - ItemID - VARCHAR (foreign key [1, N])
    - ClientID - VARCHAR (foreign key [1, N=Client.BorrowingLimit])

Reservation

- Attributes
    - ReservationID - VARCHAR
    - Status - BOOLEAN
    - ReservationDate  - DATE
    - ItemID - VARCHAR (foreign key [1, N])
    - ClientID - VARCHAR - (foreign key [1, 1])

Membership

- Attributes
    - MembershipType - VARCHAR
    - BorrowingLimit - INT (0≤ BorrowingLimite)
    - LateFee - DECIMAL(5, 2)

Creates

- Attributes
    - ItemID - VARCHAR (foreign key [1, N])
    - AuthorID - VARCHAR (foreign key [1, N])
        - Together, these two are the composite primary key

Publishes

- Attributes
    - ItemID - VARCHAR (foreign key [1, N])
    - PublisherID  - VARCHAR (foreign key [1, N])
        - Together, these two are the composite primary key
