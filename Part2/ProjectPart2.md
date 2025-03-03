# Introduction

## Project Overview
Purpose of DB and intended use. 
The purpose of the database The Librarians are working on building is a database that makes use of storing library property, track members, member activity, fines/fees, and much more. This makes our database system suited for libraries to be able to handle most tasks for organizational purposes including report generation. 


## Scope
Define boundaries of project (what will/won't be covered)
The project will be implementing the ability to manage books and digital material with appropriate attributes that are common of all expected literatures as well as its availability. Clients will be tracked in the system in terms of unique ID, memberships, and their activity with library property. This includes transactions and time stamps which all will be included in the report. 

What the project will not cover is sophisticated UI, recommendation systems, external integrations, or complex permission systems. The Librarians are not in charge of developing these systems as we expect only appointed staff and users to be able to manage these systems under the authority of those in charge of the library or business. The goal is to have a simple readable and usable system without the complexity of creating a distracting UI or system as the focus is accuracy and efficiency.

## Glossary
Include glossary of terms or acronyms (if any) used in the document
Entries below are defined as (Term) -> (Definition).

The Librarians  ->  The alias used by the team developing library database system.
DB              ->  An acronym for database. 

# Stakeholders  
The following numbered sections define who is the target audience for the database system (in no particular order).

1. End-Users  
  &nbsp; Employees - Individuals who are appointed by the owner or manager of the library or business to interact with the database. May also be described as internal users. 

2. Database Administrators  
 &nbsp; This may be anyone with experience in database management system that may be contracted by the library or business to manage a copy of the DB management system developed by The Librarians.

3. Library/Business Executives   
  &nbsp; This is anyone of an executive position in the business or library that may want to access information or data in the DB in order to make any decisions or changes to their system.

# Requirements

## Functional Requirements 

Find all books with the same  
  &nbsp;(1.) author  
  &nbsp;(2.) pubication year  
  &nbsp;(3.) availability status  

Check the following for a member:  
  &nbsp;(1.) membership status  
  &nbsp;(2.) total fines  

Display the following for a genre:  
  &nbsp;(1.) Most frequent borrowers  
  &nbsp;(2.) Average borrowing time  
  
Calculate the following statistics to help with stocking decisions:  
  &nbsp;(1.) Most popular author in the last month  
  &nbsp;(2.) Most frequently borrowed items for each client type  
  &nbsp;(3.) all items, their current availability status, and their last borrowed date. Highlight items that have not been borrowed in the past six months  

Display the following information about fines and due dates:  
  &nbsp;(1.) all books due within the next week, sorted by due date  
  &nbsp;(2.) all memebers with overdue books, along with the title of the overdue books  
  &nbsp;(3.) all members who have exceeded their borrowing limits  
  &nbsp;(4.) the average loan duration  
  &nbsp;(5.) a report listing all overdue items, the client responsible, and the calculated late fees  
  &nbsp;(6.) which clients have never returned an item late  
  &nbsp;(7.) an individual report for each client showing their borrowing history, outstanding fees, and any reserved items  

Generate the following reports:  
  &nbsp;(1.) Monthly fees report: a report of total fees collected within the last month, broken down by membership type  
  &nbsp;(2.) Monthly summary report: Generate a report summarizing the total number of items loaned, total fees collected, and most popular items for the month  
  &nbsp;(3.) Statistics breakdown: Breakdown the statistics by client type and item category (books, digital media, magazines)  
  &nbsp;(4.) Revenue summary: Summarize the library’s revenue from fees, showing the breakdown by membership type and item category  

Generate a report that provides a comprehensive analysis of the library's book collection, examining the distribution of books by genre, identifying trends in acquisition over the past 5 years, and assessing the age of the collection to identify outdated materials. The report will highlight books with borrowing and return rates and identify under-represented genres or authors for their frequency of borrowing.

## Data Entities

Below are the primary entities in the library database system along with their attributes:

### 1. **Book**
   - `BookID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique identifier for each book.
   - `Title` (VARCHAR) - Title of the book.
   - `Author` (VARCHAR) - Author(s) of the book.
   - `ISBN` (VARCHAR, UNIQUE) - Unique ISBN number.
   - `PublicationYear` (YEAR) - Year of publication.
   - `Genre` (VARCHAR) - Genre/category of the book.
   - `AvailabilityStatus` (ENUM) - Status (Available, Checked Out, Reserved).

### 2. **DigitalMedia**
   - `MediaID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique identifier for each digital media item.
   - `Title` (VARCHAR) - Title of the media.
   - `Creator` (VARCHAR) - Creator/Author of the media.
   - `PublicationYear` (YEAR) - Year of publication.
   - `Format` (VARCHAR) - Type (e.g., eBook, Audiobook).
   - `AvailabilityStatus` (ENUM) - Status (Available, Checked Out, Reserved).

### 3. **Magazine**
   - `MagazineID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique identifier for each magazine.
   - `Title` (VARCHAR) - Title of the magazine.
   - `IssueNumber` (VARCHAR) - Issue number.
   - `PublicationDate` (DATE) - Date of publication.
   - `AvailabilityStatus` (ENUM) - Status (Available, Checked Out, Reserved).

### 4. **Client**
   - `ClientID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique identifier for each client.
   - `Name` (VARCHAR) - Full name of the client.
   - `ContactInfo` (VARCHAR) - Email or phone number.
   - `MembershipType` (ENUM) - Type of membership (Regular, Student, Senior, etc.).
   - `AccountStatus` (ENUM) - Active, Suspended, or Inactive.

### 5. **MembershipType**
   - `MembershipType` (ENUM, PRIMARY KEY) - Defines the type of membership.
   - `BorrowingLimit` (INT) - Maximum number of items that can be borrowed.
   - `LateFeeRate` (DECIMAL) - Fee charged per day for overdue items.

### 6. **Transaction**
   - `TransactionID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique transaction identifier.
   - `ClientID` (INT, FOREIGN KEY) - The client borrowing/returning the item.
   - `ItemID` (INT, FOREIGN KEY) - References `BookID`, `MediaID`, or `MagazineID`.
   - `ItemType` (ENUM) - Identifies whether it's a book, digital media, or magazine.
   - `CheckoutDate` (DATETIME) - Timestamp when the item was checked out.
   - `DueDate` (DATETIME) - Due date for return.
   - `ReturnDate` (DATETIME, NULLABLE) - Timestamp when the item was returned.
   - `LateFee` (DECIMAL, NULLABLE) - Fee charged if returned late.

### 7. **Reservation**
   - `ReservationID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique identifier for each reservation.
   - `ClientID` (INT, FOREIGN KEY) - The client reserving the item.
   - `ItemID` (INT, FOREIGN KEY) - References `BookID`, `MediaID`, or `MagazineID`.
   - `ItemType` (ENUM) - Identifies whether it's a book, digital media, or magazine.
   - `ReservationDate` (DATETIME) - When the reservation was made.
   - `Status` (ENUM) - Pending, Fulfilled, or Cancelled.

### 8. **Notification**
   - `NotificationID` (INT, PRIMARY KEY, AUTO_INCREMENT) - Unique identifier for each notification.
   - `ClientID` (INT, FOREIGN KEY) - The client receiving the notification.
   - `Type` (ENUM) - Due Date Reminder, Overdue Notice, Reservation Available.
   - `Message` (TEXT) - Notification content.
   - `SentDate` (DATETIME) - When the notification was sent.


# Hardware and Software Requirements 

### 1. **Hardware Requirements**
- **Servers:** EECS cycle servers at The University of Kansas Campus.
- **Minimum Storage Requirements:** Estimated disk space requirement of at least 10GB for initial deployment.
- **Memory Requirements:** 8GB RAM recommended.
- **Processor Requirements:** Core i3 or equivalent
- **Internet Specificatins:** Ethernet IEEE 802.3 recommended for optimal speeds and stable connection

### 2. **Software Requirements**
- **Database Management System (DBMS):** MariaDB (latest stable version).
- **Operating System:** Ubuntu Linux (latest stable version)—will be ran on EECS cycle servers).
- **Programming Languages:** SQL (for database queries and scripts).
- **User Authentication:** Implement basic user authentication for client and staff access.

- *May design a user interface for Library Staff and/or Clients roles*




