-- Membership types
CREATE TABLE Membership (
  MembershipType VARCHAR(50) NOT NULL PRIMARY KEY,
  BorrowingLimit INT NOT NULL CHECK (BorrowingLimit >= 0),
  LateFee DECIMAL(5,2) NOT NULL CHECK (LateFee >= 0)
);

-- Clients
CREATE TABLE Client (
  ClientID VARCHAR(36) NOT NULL PRIMARY KEY,
  Email VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  AccountStatus ENUM('Active','Suspended','Inactive') NOT NULL DEFAULT 'Active',
  MembershipType VARCHAR(50),
  FOREIGN KEY (MembershipType) REFERENCES Membership(MembershipType)
);

-- Supertype for all items
CREATE TABLE Item (
  ItemID VARCHAR(36) NOT NULL PRIMARY KEY
);

-- Books
CREATE TABLE Book (
  ItemID VARCHAR(36) NOT NULL PRIMARY KEY,
  Genre VARCHAR(100),
  ISBN VARCHAR(13) NOT NULL UNIQUE,
  PublicationDate DATE,
  Title VARCHAR(255),
  CopiesAvailable INT NOT NULL DEFAULT 0,
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

-- Digital media
CREATE TABLE DigitalMedia (
  ItemID VARCHAR(36) NOT NULL PRIMARY KEY,
  MediaID VARCHAR(36) NOT NULL UNIQUE,
  Format VARCHAR(50),
  PublicationDate DATE,
  Title VARCHAR(255),
  CopiesAvailable INT NOT NULL DEFAULT 0,
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

-- Magazines
CREATE TABLE Magazine (
  ItemID VARCHAR(36) NOT NULL PRIMARY KEY,
  MagazineID VARCHAR(36) NOT NULL UNIQUE,
  IssueNumber VARCHAR(50) NOT NULL,
  PublicationDate DATE,
  Title VARCHAR(255),
  CopiesAvailable INT NOT NULL DEFAULT 0,
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

-- Authors and publishers
CREATE TABLE Author (
  AuthorID VARCHAR(36) NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

CREATE TABLE Publisher (
  PublisherID VARCHAR(36) NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL
);

-- Many-to-many between items and authors/publishers
CREATE TABLE Creates (
  ItemID VARCHAR(36) NOT NULL,
  AuthorID VARCHAR(36) NOT NULL,
  PRIMARY KEY (ItemID, AuthorID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Publishes (
  ItemID VARCHAR(36) NOT NULL,
  PublisherID VARCHAR(36) NOT NULL,
  PRIMARY KEY (ItemID, PublisherID),
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- Notifications
CREATE TABLE Notification (
  NotificationID VARCHAR(36) NOT NULL PRIMARY KEY,
  SendDate DATE,
  Message TEXT,
  ClientID VARCHAR(36) NOT NULL,
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

-- Transactions
CREATE TABLE `Transaction` (
  TransactionID VARCHAR(36) NOT NULL PRIMARY KEY,
  ItemID VARCHAR(36) NOT NULL,
  ClientID VARCHAR(36) NOT NULL,
  LateFee DECIMAL(5,2),
  DueDate DATE,
  CheckoutDate DATE,
  ReturnDate DATE,
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

-- Reservations
CREATE TABLE Reservation (
  ReservationID VARCHAR(36) NOT NULL PRIMARY KEY,
  Status ENUM('Pending','Fulfilled','Cancelled') NOT NULL DEFAULT 'Pending',
  ReservationDate DATE,
  ItemID VARCHAR(36) NOT NULL,
  ClientID VARCHAR(36) NOT NULL,
  FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);