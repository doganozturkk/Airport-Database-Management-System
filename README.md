<h1 align="center">
  <span style="
    background: linear-gradient(to right, #0d6efd, #20c997);
    -webkit-background-clip: text;
    color: transparent;
    font-size: 40px;
    font-weight: 900;
  ">
    Airport Database Management System
  </span>
</h1>

<p align="center" style="
  font-size: 18px;
  color: #555;
  margin-top: -10px;
">
  <i>A comprehensive relational database project developed progressively through five assignments using MySQL and PostgreSQL</i>
</p>

<p align="center">
  <img src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExOTl6eGV2NGxoZ2xuaHFxaDA2cDY3bTNnNHozMGY4eWh3MzZjNW51ciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/10LKovKon8DENq/giphy.gif" width="320" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Database%20Design-E--R%20Model-6f42c1?style=for-the-badge">
  <img src="https://img.shields.io/badge/Database-MySQL-00758f?logo=mysql&logoColor=white&style=for-the-badge">
  <img src="https://img.shields.io/badge/Database-PostgreSQL-336791?logo=postgresql&logoColor=white&style=for-the-badge">
  <img src="https://img.shields.io/badge/Container-Docker-2496ed?logo=docker&logoColor=white&style=for-the-badge">
  <img src="https://img.shields.io/badge/SQL-Advanced%20Queries-e44d26?style=for-the-badge">
  <img src="https://img.shields.io/badge/Database-Trigger%20%7C%20Transaction%20%7C%20Procedure-2ea44f?style=for-the-badge"> </p>
</p>

---

## 📌 Overview

A comprehensive **Airport Database Management System** developed progressively across five database assignments.

The project begins with the conceptual design of an **Entity-Relationship model** and gradually evolves into a complete relational database implementation featuring **database design, normalization-oriented entity relationships, MySQL implementation, Docker-based development environments, SQL queries, views, aggregation, HAVING clauses, triggers, transactions, stored procedures, scheduled events, and PostgreSQL migration**.

The database models multiple operational areas of an airport, including:

* Employee management
* Employment information
* Positions and shifts
* Airport establishments
* Establishment categories and locations
* Floors and airport facilities
* Airlines
* Airports and destinations
* Flight schedules
* Gates
* Flight statistics
* Parking sections
* Parking durations and pricing

Each assignment represents a new stage of database development and builds upon the implementation created in the previous stage.

The final stage migrates the existing MySQL-based implementation to **PostgreSQL**, adapting the database schema, SQL queries, triggers, transactions, procedures, and related syntax to the PostgreSQL ecosystem.

---

## 🏗️ Database Domain

The project models the internal operations and information systems of an airport.

Airport employees work in different positions such as:

* Air Traffic Controller
* Security Officer
* Baggage Handler
* Pilot
* Other airport-related positions

For each employee, the system can maintain information related to:

* Position
* Shift
* Salary
* Employment date
* Education level

The database also models establishments located inside the airport, including:

* Restaurants
* Bars
* Information kiosks
* Gift shops
* Retail stores
* Other airport establishments

Each establishment can be associated with a specific:

* Establishment category
* Location
* Floor
* Airport
* Employee

Flight operations are represented through relationships between:

* Airports
* Airlines
* Gates
* Schedules
* Flights
* Flight statistics

The parking subsystem stores information about:

* Parking areas
* Parking sections
* Parking duration categories
* Parking prices

---

## 📁 Project Structure

```text
airport-database-management-system/
│
├── Task1 (E-R Diagram)/
│
├── Task2/
│   └── Task2.sql
│   └── docker-compose.yml
│
├── Task3.sql
│
├── Task4.sql
│
├── Task5/
│   └── Task5.sql
│   └── (POSTGRE)docker-compose.yml
│
└── README.md
```

The project is organized chronologically, allowing the complete development process to be followed from the initial E-R model to the final PostgreSQL implementation.

---

## 🧩 Assignment Progression

The database was developed incrementally through five assignments.

Each assignment extends the previous implementation and introduces new database concepts.

### Assignment 01 — E-R Model Design

The first stage focuses on the conceptual design of the Airport Database.

An **Entity-Relationship model** was created to represent the main entities and relationships required by the airport domain.

The assignment required:

* 17 entities, including intermediate entities
* A single attribute as the primary key for each entity
* Proper entity relationships
* Identification of intermediate entities
* Structured representation of the airport domain

The E-R model establishes the foundation for all later database implementations.

Main database areas include:

* Employee management
* Positions and shifts
* Employment information
* Airport establishments
* Locations and floors
* Airlines
* Airports
* Gates
* Flight schedules
* Flight statistics
* Parking areas and pricing

---

### Assignment 02 — MySQL Database Implementation

The second stage transforms the conceptual E-R model into a working relational database using **MySQL**.

The implementation includes:

* Database creation
* User creation
* Database privilege management
* Table creation
* Primary keys
* Foreign keys
* Foreign key constraints
* Test data generation
* Data insertion
* Output verification

The local database environment is deployed using **Docker**.

The environment includes:

```text
MySQL Server
    │
    ├── Port 3306
    │
    ├── MySQL Workbench
    │
    └── phpMyAdmin
```

The SQL script is designed to recreate the database structure and populate it with test data.

To support repeated execution, tables are removed safely before being recreated.

Conceptually:

```sql
DROP TABLE IF EXISTS table_name;
```

The implementation also introduces database users with different access levels, including:

* A user with database modification privileges
* A read-only user

---

## 🐬 MySQL Development Environment

The MySQL environment is containerized using Docker.

The main components are:

```text
Docker
│
├── MySQL Server
│   ├── Database storage
│   ├── Port 3306
│   └── SQL execution
│
└── phpMyAdmin
    ├── Browser-based administration
    └── Database inspection
```

This allows the database environment to be started consistently without manually installing and configuring the complete server stack.

---

### Assignment 03 — Advanced SQL Queries

The third stage focuses on retrieving and manipulating data using SQL.

The assignment implements solutions for seven database questions related to the airport domain.

The queries demonstrate the use of:

* `SELECT`
* `WHERE`
* `JOIN`
* `LEFT JOIN`
* `GROUP BY`
* Aggregate functions
* `HAVING`
* `CREATE VIEW`
* Date calculations
* Subqueries
* `UPDATE`
* `DELETE`

The implemented database operations answer questions such as:

#### 1. Safety Officer Employees

Find employees employed in the position of:

```text
Safety Officer
```

This demonstrates filtering employees through their relationship with the position table.

---

#### 2. Bar Categories and Locations

List all categories of bars together with their corresponding locations.

Categories must also be included even when no locations currently exist for them.

This type of requirement demonstrates the importance of outer joins, especially:

```sql
LEFT JOIN
```

---

#### 3. Employee Employment Duration

List every employee together with:

* Their employment date
* The current number of days they have been employed

This query demonstrates date calculations and SQL functions.

Conceptually:

```text
Current Date
      │
      ▼
Employment Date
      │
      ▼
Calculate Difference
      │
      ▼
Employment Duration in Days
```

---

#### 4. Establishment Statistics by Floor

Calculate how many locations of each establishment type are located on each floor.

This demonstrates:

* Multi-table relationships
* Aggregation
* Grouping

The query structure conceptually follows:

```text
Establishment Type
        +
      Floor
        │
        ▼
    GROUP BY
        │
        ▼
    COUNT(*)
```

---

#### 5. Airline With the Most Departures

Determine which airline had the highest number of departures during the previous month.

The assignment specifically avoids relying on:

```sql
LIMIT
```

Instead, the query can use aggregation and comparison logic.

This demonstrates:

* Date filtering
* Flight aggregation
* Airline grouping
* Maximum-value determination

---

#### 6. Airline Name Update

The airline:

```text
Swiss International
```

is updated to:

```text
Swiss International Air Lines
```

The assignment requires the relevant table to be displayed both:

1. Before the update
2. After the update

This demonstrates controlled data modification using:

```sql
UPDATE
```

---

#### 7. Establishment Deletion

The establishment:

```text
SLOWatch
```

is removed from the database.

The relevant table is displayed both:

1. Before the deletion
2. After the deletion

This demonstrates:

```sql
DELETE
```

operations and verification of data modification.

---

### Assignment 04 — Advanced Database Objects

The fourth stage introduces database programming and automation features.

Four advanced functionalities are implemented:

* Trigger
* Transaction
* Stored Procedure
* Event

---

## ⚡ Trigger

A database trigger provides automatic functionality when a specified database operation occurs.

The implementation uses trigger concepts such as:

```sql
NEW
```

or:

```sql
OLD
```

depending on the required operation.

Triggers allow the database to react automatically to changes such as:

* Insert operations
* Update operations
* Delete operations

Conceptually:

```text
Database Operation
        │
        ▼
   INSERT / UPDATE / DELETE
        │
        ▼
      TRIGGER
        │
        ▼
Automatic Database Action
```

---

## 🔄 Transaction

Transactions allow multiple database operations to be treated as a single logical unit.

The implementation contains at least two operations.

Conceptually:

```text
START TRANSACTION
        │
        ▼
   Operation 1
        │
        ▼
   Operation 2
        │
        ▼
   COMMIT
```

If an error occurs, the transaction can be rolled back to maintain database consistency.

```text
START TRANSACTION
        │
        ▼
   Operations
        │
        ▼
      Error
        │
        ▼
     ROLLBACK
```

Main concepts include:

* Atomicity
* Data consistency
* Commit
* Rollback
* Multi-step database operations

---

## ⚙️ Stored Procedure

A stored procedure is created to encapsulate reusable database functionality.

Stored procedures allow SQL logic to be stored and executed directly inside the database server.

Conceptually:

```text
Client
   │
   ▼
CALL Procedure
   │
   ▼
Stored SQL Logic
   │
   ▼
Database Operations
```

This introduces procedural database programming and reusable server-side functionality.

---

## ⏰ Event

A scheduled database event is implemented to automatically execute the previously created procedure.

Conceptually:

```text
Scheduled Time
      │
      ▼
Database Event
      │
      ▼
Stored Procedure
      │
      ▼
Automatic Operation
```

This demonstrates database automation without requiring manual execution from an external application.

---

### Assignment 05 — PostgreSQL Migration

The final stage migrates the existing database implementation from **MySQL to PostgreSQL**.

The previous work from the earlier assignments is adapted to PostgreSQL.

This includes:

* DDL migration
* DML migration
* SQL query adaptation
* Trigger adaptation
* Transaction adaptation
* Procedure and function adaptation
* PostgreSQL-specific syntax
* Docker-based PostgreSQL environment

The PostgreSQL version consolidates and adapts the work completed in Tasks 2, 3, and 4.

---

## 🐘 PostgreSQL Development Environment

The PostgreSQL environment is also deployed using Docker.

The environment includes:

```text
Docker
│
├── PostgreSQL Server
│   ├── Port 5432
│   ├── Database storage
│   └── SQL execution
│
└── pgAdmin
    ├── Browser-based administration
    └── Database inspection
```

The database can also be managed using compatible desktop tools such as:

* DBeaver
* pgAdmin

---

## 🔁 MySQL to PostgreSQL Migration

Migrating the project requires adapting several MySQL-specific features.

### Identity Columns

MySQL-style:

```sql
AUTO_INCREMENT
```

is adapted to PostgreSQL-compatible identity handling such as:

```sql
SERIAL
```

or PostgreSQL identity columns.

---

### Procedural SQL

MySQL stored procedures and triggers are adapted to PostgreSQL procedural syntax using:

```sql
PL/pgSQL
```

Functions and procedures can use PostgreSQL constructs such as:

```sql
CREATE OR REPLACE FUNCTION
```

and:

```sql
CREATE OR REPLACE PROCEDURE
```

---

### SQL Compatibility

PostgreSQL applies stricter rules in several areas, particularly when using:

* `GROUP BY`
* Aggregate functions
* Identifier handling
* Procedural SQL
* Data types

Therefore, the original MySQL queries are reviewed and adapted to ensure correct PostgreSQL execution.

---

## 🗃️ Database Architecture

The database is divided into several connected domains.

```text
                         AIRPORT DATABASE
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
          ▼                     ▼                     ▼
     EMPLOYEES            ESTABLISHMENTS        FLIGHT OPERATIONS
          │                     │                     │
          │                     │                     │
    ┌─────┼─────┐        ┌──────┼──────┐       ┌─────┼─────┐
    │     │     │        │      │      │       │     │     │
    ▼     ▼     ▼        ▼      ▼      ▼       ▼     ▼     ▼
Employee Position Shift Establishment Type   Airline Gate Flight
          │                     │                     │
          ▼                     ▼                     ▼
     Employment              Location             Schedule
                              │                     │
                              ▼                     ▼
                            Floor            FlightStatistics
                                │
                                │
                                ▼
                         PARKING SYSTEM
                                │
                    ┌───────────┼───────────┐
                    ▼           ▼           ▼
                ParkingLot ParkingSection Pricing
                                            │
                                            ▼
                                         Duration
```

The complete design connects these entities through primary and foreign key relationships.

---

## 🔑 Database Relationships

The project demonstrates the practical use of relational database relationships.

Examples include:

### Employee Relationships

```text
Employee
   │
   ├── Position
   │
   ├── Shift
   │
   └── Employment
```

---

### Establishment Relationships

```text
Establishment
      │
      ├── Establishment Type
      │
      └── Location
              │
              ▼
            Floor
```

---

### Flight Relationships

```text
Airline
   │
   ▼
Flight Schedule
   │
   ├── Airport
   ├── Gate
   └── Flight
           │
           ▼
    Flight Statistics
```

---

### Parking Relationships

```text
Parking Lot
     │
     ▼
Parking Section
     │
     ▼
   Pricing
     │
     ▼
  Duration
```

---

## 🛠️ Technologies

* **SQL**
* **MySQL**
* **PostgreSQL**
* **Docker**
* **Docker Compose**
* **phpMyAdmin**
* **pgAdmin**
* **MySQL Workbench**
* **DBeaver**
* **Entity-Relationship Modeling**
* **Relational Database Design**
* **DDL**
* **DML**
* **DCL**
* **Database Triggers**
* **Transactions**
* **Stored Procedures**
* **Database Events**
* **PL/pgSQL**

---

## ✨ Key Features

✔ Complete airport-oriented relational database design

✔ Entity-Relationship model with 17 entities

✔ Employee and employment management

✔ Position and shift tracking

✔ Airline and airport management

✔ Flight schedules and gate management

✔ Flight statistics

✔ Parking sections and pricing

✔ MySQL database implementation

✔ Docker-based MySQL environment

✔ phpMyAdmin database administration

✔ Date calculations

✔ Database trigger implementation

✔ Transaction management

✔ PostgreSQL migration

✔ PL/pgSQL adaptation

✔ Docker-based PostgreSQL environment

✔ pgAdmin integration

---

## 🚀 How to Run

### MySQL Environment

Navigate to the MySQL assignment directory containing the Docker configuration.

Start the containers with:

```bash
docker-compose up -d
```

The MySQL server can then be accessed through:

```text
Host: localhost
Port: 3306
```

phpMyAdmin can be accessed through the configured browser address.

After connecting to the MySQL server:

1. Open the MySQL SQL script.
2. Execute the script.
3. Create the database.
4. Create the required tables.
5. Apply foreign key constraints.
6. Insert the test data.
7. Execute the verification queries.

---

### PostgreSQL Environment

Navigate to the PostgreSQL assignment directory.

Start the PostgreSQL environment with:

```bash
docker-compose up -d
```

The PostgreSQL server is available through the configured port:

```text
5432
```

pgAdmin can be used to manage and inspect the database through the configured web interface.

After establishing a PostgreSQL connection:

1. Open the PostgreSQL SQL script.
2. Execute the database creation and table definitions.
3. Insert the required data.
4. Execute the migrated SQL queries.
5. Create the PostgreSQL functions, triggers, and procedures.

---

## 🧠 Database Concepts Demonstrated

### Database Design

* Entity-Relationship modeling
* Entity identification
* Intermediate entities
* Primary keys
* Foreign keys
* Relational relationships
* Schema design

### SQL

* `CREATE DATABASE`
* `CREATE TABLE`
* `ALTER TABLE`
* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`
* `DROP TABLE`
* `JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* Aggregate functions
* Subqueries
* Views
* Date calculations

### Database Programming

* Triggers
* `NEW`
* `OLD`
* Transactions
* `COMMIT`
* `ROLLBACK`
* Stored procedures
* Functions
* Database events
* PL/pgSQL

### Database Environments

* Docker containers
* Docker Compose
* MySQL
* PostgreSQL
* phpMyAdmin
* pgAdmin

---

## 📈 Project Evolution

The project demonstrates how a database system can gradually evolve from a conceptual model into a complete multi-database implementation.

```text
E-R Model Design
        ↓
MySQL Database Implementation
        ↓
Advanced SQL Queries
        ↓
Triggers, Transactions & Procedures
        ↓
PostgreSQL Migration
```

Each assignment introduces a new layer of database functionality while preserving and extending the existing airport data model.

---

## 🎓 Academic Context

This project was developed as part of the **Databases course at the University of Maribor**.

The project was completed progressively through five assignments covering database modeling, implementation, SQL querying, advanced database objects, and migration from MySQL to PostgreSQL.

---

## 📄 License

This project is licensed under the MIT License — feel free to fork it, extend it, and experiment with the database design and SQL implementation.

---

## 🙌 Author

Developed by: **[@doganozturkk](https://github.com/doganozturkk)**
