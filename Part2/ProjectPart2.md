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

Will edit later. Copy and pasted from project description:

• List all books by a specific author: Display all books in the library collection written by a
particular author.

• Find books by publication year: Retrieve a list of books published in a specific year.

• Check membership status: Display the current status and account information for a specific
client based on their unique ID.

• Fine calculation: Calculate the total fines owed by each member, considering overdue books
and a daily fine rate (e.g., $0.25 per day).

• Book availability: Display a list of all available books (not currently borrowed) within a
specific genre.

• Frequent borrowers of a specific genre: Identify the members who have borrowed the
most books in a particular genre (e.g., "Mystery") in the last year.

• Books due soon: Generate a report of all books due within the next week, sorted by due date.

• Members with overdue books: List all members who currently have at least one overdue
book, along with the titles of the overdue books.

• Average borrowing time: Calculate the average number of days members borrow books for
a specific genre.

• Most popular author in the last month: Determine the author whose books have been
borrowed the most in the last month.

• Monthly fees report: Generate a report of total fees collected within the last month, broken
down by membership type.

• Exceeded borrowing limits: Produce a list of clients who have exceeded their borrowing
limits.

• Frequent borrowed items by client type: Determine the most frequently borrowed items
by each client type.

• Never late returns: Find out which clients have never returned an item late.

• Average loan duration: Calculate the average time an item stays on loan before being
returned.

• Monthly summary report: Generate a report summarizing the total number of items loaned,
total fees collected, and most popular items for the month.

• Statistics breakdown: Breakdown the statistics by client type and item category (books,
digital media, magazines).

• Client borrowing report: Produce an individual report for each client showing their
borrowing history, outstanding fees, and any reserved items.

• Item availability and history: List all items, their current availability status, and their last
borrowed date. Highlight items that have not been borrowed in the past six months.

• Overdue items report: Generate a report listing all overdue items, the client responsible, and
the calculated late fees.

• Revenue summary: Summarize the library’s revenue from fees, showing the breakdown by
membership type and item category

## Data Entities

{{{{Delete this later: Data Entities: List and describe the main data entities and their attributes and their data types or constraints. Note: these should represent major entities and their attributes (see the project description as the starting point); the list may be expanded upon when you develop the conceptual model.}}}}

# Hardware and Software Requirements 
The hardware the team plans to use is the EECS cycle servers at The University of Kansas Campus. As for the software that the team plans to use is MariaDB on the servers mentioned earlier. 




