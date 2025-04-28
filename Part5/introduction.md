<!-- 
Project Overview: Briefly reiterate the purpose and main functionalities of your database, maintaining consistency with your previous project parts. Scope: Re-emphasize the boundaries of your project, clarifying included and excluded data and functionalities. Glossary: Update your glossary with any new terms or concepts relevant to relational database design. The introduction section is for continuity; the italic parts are subsections.
 -->

<!-- Project Overview & Purpose -->
# Introduction

The purpose of this database is to provide a comprehensive solution for libraries to manage their everyday operations efficiently. The database supports functionalities such as tracking library items (books, digital media, and magazines), managing client memberships, recording transactions, handling reservations, and generating detailed reports. By streamlining these tasks, the system aims to improve the overall efficiency and accuracy of library operations.

<!-- Scope -->
The database will include features for managing library collections, client memberships, borrowing and reservation activities, and generating various reports. It will not cover advanced user interfaces, recommendation systems, or external integrations. The focus is on providing a robust backend system that ensures data accuracy and operational efficiency.

<!-- Choose Your Platform -->
# Platform Design Explanation

We have chosen MariaDB as the database platform for this project due to its user-friendly nature, seamless integration with Cycle Servers, and prior experience with the system. In EECS 348 (Software Engineering I), one of the later lab assignments involved working with MariaDB, making it a familiar and practical choice. Additionally, hosting the database on KU's Cycle Server infrastructure eliminates the need for dedicated hardware, providing a reliable and cost-effective solution. MariaDB also benefits from strong community support and regular updates, ensuring both reliability and security. While MariaDB meets the requirements of this application, it is worth noting that it lacks some advanced features available in enterprise-grade databases like Oracle or SQL Server.

<!-- Glossary -->
- **DB:** Acronym for Database.
- **Library Item:** Refers to books, digital media, or magazines managed by the system.
- **Client:** A library member with a unique ID and membership type.
- **Transaction:** A record of borrowing or returning a library item.
- **Reservation:** A record of a client reserving a library item.
- **Membership Type:** Categories of library memberships, such as Regular, Student, or Senior, each with specific borrowing limits and fee structures.
