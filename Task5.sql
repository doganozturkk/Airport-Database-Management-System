-- Name: Dogan Ozturk
-- Student ID: 1002781671
-- Title: Airport Database
-- Assignment: Task 2

-- DATABASE

CREATE DATABASE airport_db;

-- DROP TABLES IF EXISTS

DROP TABLE IF EXISTS EmployeeEstablishment;
DROP TABLE IF EXISTS Employment;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Position;
DROP TABLE IF EXISTS Shift;
DROP TABLE IF EXISTS Establishment;
DROP TABLE IF EXISTS EstablishmentType;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Floor;

DROP TABLE IF EXISTS Flight;
DROP TABLE IF EXISTS FlightStatistics;
DROP TABLE IF EXISTS Gate;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Airline;
DROP TABLE IF EXISTS Airport;

DROP TABLE IF EXISTS ParkingSection;
DROP TABLE IF EXISTS ParkingLot;
DROP TABLE IF EXISTS Pricing;
DROP TABLE IF EXISTS Duration;

-- CREATE TABLES

CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    description VARCHAR(45)
);

CREATE TABLE Floor (
    floor_id SERIAL PRIMARY KEY,
    floor_number INT
);

CREATE TABLE EstablishmentType (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(45)
);

CREATE TABLE Airport (
    airport_id SERIAL PRIMARY KEY,
    name VARCHAR(45),
    city VARCHAR(45),
    country VARCHAR(45)
);

CREATE TABLE Shift (
    shift_id SERIAL PRIMARY KEY,
    shift_name VARCHAR(45)
);

CREATE TABLE "Position" (
    position_id SERIAL PRIMARY KEY,
    position_name VARCHAR(45)
);

CREATE TABLE Duration (
    duration_id SERIAL PRIMARY KEY,
    hours INT
);

CREATE TABLE Airline (
    airline_id SERIAL PRIMARY KEY,
    name VARCHAR(45)
);

CREATE TABLE Schedule (
    schedule_id SERIAL PRIMARY KEY,
    date DATE
);

CREATE TABLE FlightStatistics (
    stat_id SERIAL PRIMARY KEY,
    passenger_count INT,
    baggage_count INT,
    delay_minutes INT,
    flight_status VARCHAR(45)
);

CREATE TABLE Pricing (
    pricing_id SERIAL PRIMARY KEY,
    price DECIMAL(10,2),
    Duration_duration_id INT
);

CREATE TABLE ParkingLot (
    parking_lot_id SERIAL PRIMARY KEY,
    name VARCHAR(45),
    Pricing_pricing_id INT,
    Airport_airport_id INT
);

CREATE TABLE ParkingSection (
    section_id SERIAL PRIMARY KEY,
    section_name VARCHAR(45),
    ParkingLot_parking_lot_id INT
);

CREATE TABLE Establishment (
    establishment_id SERIAL PRIMARY KEY,
    name VARCHAR(45),
    EstablishmentType_type_id INT,
    Location_location_id INT,
    Floor_floor_id INT,
    Airport_airport_id INT
);

CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(45),
    surname VARCHAR(45),
    Position_position_id INT,
    Shift_shift_id INT
);

CREATE TABLE Employment (
    employment_id SERIAL PRIMARY KEY,
    salary INT,
    hire_date DATE,
    education_level VARCHAR(45),
    Employee_employee_id INT
);

CREATE TABLE EmployeeEstablishment (
    employee_establishment_id SERIAL PRIMARY KEY,
    Employee_employee_id INT,
    Establishment_establishment_id INT
);

CREATE TABLE Gate (
    gate_id SERIAL PRIMARY KEY,
    gate_number VARCHAR(45),
    terminal VARCHAR(45),
    Airport_airport_id INT
);

CREATE TABLE Flight (
    flight_id SERIAL PRIMARY KEY,
    flight_number VARCHAR(45),
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    Airline_airline_id INT,
    Airport_airport_id INT,
    Gate_gate_id INT,
    Schedule_schedule_id INT,
    FlightStatistics_stat_id INT
);

-- FOREIGN KEYS

ALTER TABLE Pricing
ADD CONSTRAINT FK_Pricing_Duration
FOREIGN KEY (Duration_duration_id)
REFERENCES Duration(duration_id);

ALTER TABLE ParkingLot
ADD CONSTRAINT FK_ParkingLot_Pricing
FOREIGN KEY (Pricing_pricing_id)
REFERENCES Pricing(pricing_id);

ALTER TABLE ParkingLot
ADD CONSTRAINT FK_ParkingLot_Airport
FOREIGN KEY (Airport_airport_id)
REFERENCES Airport(airport_id);

ALTER TABLE ParkingSection
ADD CONSTRAINT FK_ParkingSection_ParkingLot
FOREIGN KEY (ParkingLot_parking_lot_id)
REFERENCES ParkingLot(parking_lot_id);

ALTER TABLE Establishment
ADD CONSTRAINT FK_Establishment_EstablishmentType
FOREIGN KEY (EstablishmentType_type_id)
REFERENCES EstablishmentType(type_id);

ALTER TABLE Establishment
ADD CONSTRAINT FK_Establishment_Location
FOREIGN KEY (Location_location_id)
REFERENCES Location(location_id);

ALTER TABLE Establishment
ADD CONSTRAINT FK_Establishment_Floor
FOREIGN KEY (Floor_floor_id)
REFERENCES Floor(floor_id);

ALTER TABLE Establishment
ADD CONSTRAINT FK_Establishment_Airport
FOREIGN KEY (Airport_airport_id)
REFERENCES Airport(airport_id);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Position
FOREIGN KEY (Position_position_id)
REFERENCES "Position"(position_id);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Shift
FOREIGN KEY (Shift_shift_id)
REFERENCES Shift(shift_id);

ALTER TABLE Employment
ADD CONSTRAINT FK_Employment_Employee
FOREIGN KEY (Employee_employee_id)
REFERENCES Employee(employee_id);

ALTER TABLE EmployeeEstablishment
ADD CONSTRAINT FK_EmployeeEstablishment_Employee
FOREIGN KEY (Employee_employee_id)
REFERENCES Employee(employee_id);

ALTER TABLE EmployeeEstablishment
ADD CONSTRAINT FK_EmployeeEstablishment_Establishment
FOREIGN KEY (Establishment_establishment_id)
REFERENCES Establishment(establishment_id);

ALTER TABLE Gate
ADD CONSTRAINT FK_Gate_Airport
FOREIGN KEY (Airport_airport_id)
REFERENCES Airport(airport_id);

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Airline
FOREIGN KEY (Airline_airline_id)
REFERENCES Airline(airline_id);

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Airport
FOREIGN KEY (Airport_airport_id)
REFERENCES Airport(airport_id);

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Gate
FOREIGN KEY (Gate_gate_id)
REFERENCES Gate(gate_id);

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Schedule
FOREIGN KEY (Schedule_schedule_id)
REFERENCES Schedule(schedule_id);

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_FlightStatistics
FOREIGN KEY (FlightStatistics_stat_id)
REFERENCES FlightStatistics(stat_id);

-- INSERT DATA (BASE TABLES)

INSERT INTO Airport (name, city, country) VALUES
('Istanbul Airport','Istanbul','Turkey'),
('Frankfurt Airport','Frankfurt','Germany'),
('Heathrow Airport','London','UK'),
('Dubai International','Dubai','UAE'),
('Charles de Gaulle','Paris','France');

INSERT INTO "Position" (position_name) VALUES
('Manager'),('Security Officer'),('Technician'),('Pilot'),('Cleaner');

INSERT INTO Shift (shift_name) VALUES
('Morning'),('Evening'),('Night'),('Flexible'),('Weekend');

INSERT INTO Airline (name) VALUES
('Turkish Airlines'),('Lufthansa'),('Ryanair'),('Emirates'),('Qatar Airways');

INSERT INTO Duration (hours) VALUES
(1),(2),(3),(4),(5);

INSERT INTO EstablishmentType (type_name) VALUES
('Retail Store'),('Coffee Shop'),('Office'),('Warehouse'),('Customer Service');

INSERT INTO Location (description) VALUES
('Terminal A - East Wing'),
('Terminal A - West Wing'),
('Terminal B - North Area'),
('Terminal B - South Area'),
('Terminal C - Central Hall');

INSERT INTO Floor (floor_number) VALUES
(1),(2),(3),(4),(5);

-- INSERT DATA (DEPENDENT TABLES)

INSERT INTO Establishment (name, EstablishmentType_type_id, Location_location_id, Floor_floor_id, Airport_airport_id) VALUES
('Duty Free Shop',1,1,1,1),
('Star Coffee',2,2,1,1),
('Admin Office A',3,3,2,2),
('Storage Unit B1',4,4,2,2),
('Customer Help Desk',5,5,1,3),
('Electronics Store',1,2,3,3),
('Coffee Express',2,3,4,4),
('Operations Office',3,4,5,4),
('Main Warehouse',4,5,1,5),
('Service Center',5,1,2,5);

INSERT INTO Employee (name, surname, Position_position_id, Shift_shift_id) VALUES
('John','Smith',1,1),
('Emily','Johnson',2,2),
('Michael','Brown',3,1),
('Sarah','Davis',4,3),
('David','Wilson',5,2),
('Daniel','Miller',1,3),
('Sophia','Taylor',2,1),
('James','Anderson',3,2),
('Olivia','Thomas',4,1),
('Liam','Moore',5,3);

INSERT INTO Employment (salary, hire_date, education_level, Employee_employee_id) VALUES
(3200,'2021-06-15','Bachelor',1),
(3400,'2022-01-10','Master',2),
(2900,'2020-09-20','Bachelor',3),
(3600,'2019-03-05','PhD',4),
(2800,'2023-07-12','High School',5),
(3300,'2021-11-01','Bachelor',6),
(3500,'2022-05-22','Master',7),
(3000,'2020-08-30','Bachelor',8),
(3700,'2018-12-17','PhD',9),
(2700,'2023-02-25','High School',10);

INSERT INTO EmployeeEstablishment (Employee_employee_id, Establishment_establishment_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO Gate (gate_number, terminal, Airport_airport_id) VALUES
('A1','Terminal 1',1),
('A2','Terminal 1',1),
('B1','Terminal 2',2),
('B2','Terminal 2',2),
('C1','Terminal 3',3),
('C2','Terminal 3',3),
('D1','Terminal 4',4),
('D2','Terminal 4',4),
('E1','Terminal 5',5),
('E2','Terminal 5',5);

INSERT INTO Schedule (date) VALUES
('2026-06-20'),
('2026-06-21'),
('2026-06-22'),
('2026-06-23'),
('2026-06-24'),
('2026-06-25'),
('2026-06-26'),
('2026-06-27'),
('2026-06-28'),
('2026-06-29');

INSERT INTO FlightStatistics (passenger_count, baggage_count, delay_minutes, flight_status) VALUES
(180,140,0,'On Time'),
(200,160,10,'Delayed'),
(150,120,0,'On Time'),
(220,180,20,'Delayed'),
(170,130,0,'On Time'),
(190,150,15,'Delayed'),
(210,170,0,'On Time'),
(230,190,25,'Delayed'),
(160,125,0,'On Time'),
(175,135,0,'On Time');

INSERT INTO Flight (flight_number, departure_time, arrival_time, Airline_airline_id, Airport_airport_id, Gate_gate_id, Schedule_schedule_id, FlightStatistics_stat_id) VALUES
('TK101','2026-04-20 08:00:00','2026-04-20 10:00:00',1,1,1,1,1),
('LH202','2026-04-21 09:00:00','2026-04-21 11:30:00',2,1,2,2,2),
('FR303','2026-04-22 10:00:00','2026-04-22 12:00:00',3,2,3,3,3),
('EK404','2026-04-23 11:00:00','2026-04-23 14:00:00',4,2,4,4,4),
('QR505','2026-04-24 12:00:00','2026-04-24 15:00:00',5,3,5,5,5),
('TK606','2026-04-25 13:00:00','2026-04-25 15:00:00',1,3,6,6,6),
('LH707','2026-04-26 14:00:00','2026-04-26 16:30:00',2,4,7,7,7),
('FR808','2026-04-27 15:00:00','2026-04-27 17:00:00',3,4,8,8,8),
('EK909','2026-04-28 16:00:00','2026-04-28 19:00:00',4,5,9,9,9),
('QR010','2026-04-29 17:00:00','2026-04-29 20:00:00',5,5,10,10,10);

INSERT INTO Pricing (price, Duration_duration_id) VALUES
(5.00,1),(10.00,2),(15.00,3),(20.00,4),(25.00,5),
(6.50,1),(11.50,2),(16.50,3),(21.50,4),(26.50,5);

INSERT INTO ParkingLot (name, Pricing_pricing_id, Airport_airport_id) VALUES
('Short Stay A',1,1),
('Short Stay B',2,1),
('Long Stay A',3,2),
('Long Stay B',4,2),
('VIP Parking',5,3),
('Economy A',6,3),
('Economy B',7,4),
('Premium Parking',8,4),
('Overflow Lot',9,5),
('Staff Parking',10,5);

INSERT INTO ParkingSection (section_name, ParkingLot_parking_lot_id) VALUES
('Section A',1),
('Section B',2),
('Section C',3),
('Section D',4),
('Section E',5),
('Section F',6),
('Section G',7),
('Section H',8),
('Section I',9),
('Section J',10);

-- SELECT CHECK

SELECT * FROM Airport;
SELECT * FROM "Position";
SELECT * FROM Shift;
SELECT * FROM Airline;
SELECT * FROM Duration;
SELECT * FROM EstablishmentType;
SELECT * FROM Location;
SELECT * FROM Floor;
SELECT * FROM Establishment;
SELECT * FROM Employee;
SELECT * FROM Employment;
SELECT * FROM EmployeeEstablishment;
SELECT * FROM Gate;
SELECT * FROM Schedule;
SELECT * FROM FlightStatistics;
SELECT * FROM Pricing;
SELECT * FROM ParkingLot;
SELECT * FROM ParkingSection;
SELECT * FROM Flight;



-- Name: Dogan Ozturk
-- Student ID: 1002781671
-- Title: Airport Database
-- Assignment: Task 3



-- QUESTION 1 RESULT
-- Which employees are employed in the position
-- of "Safety Officer"?
-- INNER JOIN is used to combine Employee and -- Position tables.

SELECT 
    'QUESTION 1 RESULT' AS Result_Title,
    e.employee_id,
    e.name,
    e.surname,
    p.position_name
FROM Employee e
JOIN "Position" p
    ON e.Position_position_id = p.position_id
WHERE p.position_name = 'Security Officer';



-- QUESTION 2 RESULT
-- List all establishment categories and their
-- corresponding locations.
-- LEFT JOIN is used to display all categories,
-- even if no establishments exist in them.
-- Establishment categories are used as bar categories
-- according to the current database model.

SELECT 
    'QUESTION 2 RESULT' AS Result_Title,
    et.type_name AS establishment_category,
    l.description AS location_description
FROM EstablishmentType et
LEFT JOIN Establishment e
    ON et.type_id = e.EstablishmentType_type_id
LEFT JOIN Location l
    ON e.Location_location_id = l.location_id
ORDER BY et.type_name;



-- QUESTION 3 RESULT
-- List each employee and their hire date.
-- Calculate how many days each employee
-- has been employed.
-- DATEDIFF function is used.

SELECT
    'QUESTION 3 RESULT' AS Result_Title,
    e.employee_id,
    e.name,
    e.surname,
    em.hire_date,
    CURRENT_DATE - em.hire_date AS days_employed
FROM Employee e
JOIN Employment em
    ON e.employee_id = em.Employee_employee_id;



-- QUESTION 4 RESULT
-- Show how many establishments of each type
-- are located on each floor.
-- Aggregate functions and GROUP BY are used.
-- HAVING clause is included.

SELECT 
    'QUESTION 4 RESULT' AS Result_Title,
    f.floor_number,
    et.type_name,
    COUNT(e.establishment_id) AS establishment_count
FROM Establishment e
JOIN Floor f
    ON e.Floor_floor_id = f.floor_id
JOIN EstablishmentType et
    ON e.EstablishmentType_type_id = et.type_id
GROUP BY f.floor_number, et.type_name
HAVING COUNT(e.establishment_id) > 0
ORDER BY f.floor_number;



-- QUESTION 5 RESULT
-- Which airline had the highest number
-- of departures last month?
-- CREATE VIEW and HAVING are used.
-- LIMIT is not used as required.

DROP VIEW IF EXISTS MonthlyDepartures CASCADE;

CREATE VIEW MonthlyDepartures AS
SELECT
    a.airline_id,
    a.name AS airline_name,
    COUNT(f.flight_id) AS total_departures
FROM Flight f
JOIN Airline a
    ON f.Airline_airline_id = a.airline_id
WHERE EXTRACT(MONTH FROM f.departure_time)
      =
      EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '1 month')

AND EXTRACT(YEAR FROM f.departure_time)
      =
      EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 month')

GROUP BY a.airline_id, a.name;

SELECT
    'QUESTION 5 RESULT' AS Result_Title,
    airline_name,
    total_departures
FROM MonthlyDepartures
WHERE total_departures =
(
    SELECT MAX(total_departures)
    FROM MonthlyDepartures
);



-- QUESTION 6 RESULT
-- Change the airline company name
-- from "Swiss International"
-- to "Swiss International Air Lines".
-- Rows are displayed before and after UPDATE.

-- Insert test data

INSERT INTO Airline (name)
VALUES ('Swiss International');


-- Display row before UPDATE

SELECT 
    'QUESTION 6 RESULT - BEFORE UPDATE' AS Result_Title,
    airline_id,
    name
FROM Airline
WHERE name = 'Swiss International';


-- Update airline name safely

UPDATE Airline
SET name = 'Swiss International Air Lines'
WHERE airline_id = (
    SELECT airline_id
    FROM (
        SELECT airline_id
        FROM Airline
        WHERE name = 'Swiss International'
    ) AS temp_table
);


-- Display row after UPDATE

SELECT 
    'QUESTION 6 RESULT - AFTER UPDATE' AS Result_Title,
    airline_id,
    name
FROM Airline
WHERE name = 'Swiss International Air Lines';



-- QUESTION 7 RESULT
-- Delete the store named "SLOWatch".
-- Rows are displayed before and after DELETE.

-- Insert test data

INSERT INTO Establishment (
    name,
    EstablishmentType_type_id,
    Location_location_id,
    Floor_floor_id,
    Airport_airport_id
)
VALUES (
    'SLOWatch',
    1,
    1,
    1,
    1
);


-- Display row before DELETE

SELECT
    'QUESTION 7 RESULT - BEFORE DELETE' AS Result_Title,
    establishment_id,
    name
FROM Establishment
WHERE name = 'SLOWatch';


-- Delete the store safely

DELETE FROM Establishment
WHERE establishment_id = (
    SELECT establishment_id
    FROM (
        SELECT establishment_id
        FROM Establishment
        WHERE name = 'SLOWatch'
    ) AS temp_table
);


-- Display result after DELETE

SELECT
    'QUESTION 7 RESULT - AFTER DELETE' AS Result_Title,
    COALESCE(establishment_id::TEXT, 'NULL') AS establishment_id,
    COALESCE(name, 'Record Deleted') AS name
FROM Establishment
WHERE name = 'SLOWatch'

UNION

SELECT
    'QUESTION 7 RESULT - AFTER DELETE',
    'NULL',
    'Record Deleted'
WHERE NOT EXISTS (
    SELECT *
    FROM Establishment
    WHERE name = 'SLOWatch'
);



-- Name: Dogan Ozturk
-- Student ID: 1002781671
-- Title: Airport Database
-- Assignment: Task 4



-- TRIGGER
-- Log newly hired employees automatically

DROP TABLE IF EXISTS EmployeeLog CASCADE;

CREATE TABLE EmployeeLog (
    log_id SERIAL PRIMARY KEY,
    employee_id INT,
    employee_name VARCHAR(45),
    employee_surname VARCHAR(45),
    log_date TIMESTAMP
);


DROP TRIGGER IF EXISTS trg_employee_insert ON Employee;
DROP FUNCTION IF EXISTS log_employee_insert();


CREATE OR REPLACE FUNCTION log_employee_insert()
RETURNS TRIGGER
AS $$
BEGIN

    INSERT INTO EmployeeLog
    (
        employee_id,
        employee_name,
        employee_surname,
        log_date
    )
    VALUES
    (
        NEW.employee_id,
        NEW.name,
        NEW.surname,
        NOW()
    );

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
EXECUTE FUNCTION log_employee_insert();


-- Test Trigger

INSERT INTO Employee
(
    name,
    surname,
    Position_position_id,
    Shift_shift_id
)
VALUES
(
    'Robert',
    'King',
    1,
    1
);


SELECT
    'TRIGGER RESULT' AS Result_Title,
    log_id,
    employee_id,
    employee_name,
    employee_surname,
    log_date
FROM EmployeeLog;



-- TRANSACTION
-- Add employee and employment information together

BEGIN;

WITH new_employee AS
(
    INSERT INTO Employee
    (
        name,
        surname,
        Position_position_id,
        Shift_shift_id
    )
    VALUES
    (
        'Anna',
        'Walker',
        2,
        2
    )
    RETURNING employee_id
)
INSERT INTO Employment
(
    salary,
    hire_date,
    education_level,
    Employee_employee_id
)
SELECT
    3500,
    CURRENT_DATE,
    'Bachelor',
    employee_id
FROM new_employee;

COMMIT;


-- Check Transaction Result

SELECT
    'TRANSACTION RESULT' AS Result_Title,
    employee_id,
    name,
    surname,
    Position_position_id,
    Shift_shift_id
FROM Employee
WHERE name = 'Anna';



-- PROCEDURE
-- Generate delayed flight report

DROP TABLE IF EXISTS DelayReport CASCADE;

CREATE TABLE DelayReport
(
    report_id SERIAL PRIMARY KEY,
    flight_id INT,
    flight_number VARCHAR(45),
    delay_minutes INT,
    report_date TIMESTAMP
);


DROP PROCEDURE IF EXISTS GenerateDelayReport();


CREATE OR REPLACE PROCEDURE GenerateDelayReport()
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO DelayReport
    (
        flight_id,
        flight_number,
        delay_minutes,
        report_date
    )
    SELECT
        f.flight_id,
        f.flight_number,
        fs.delay_minutes,
        NOW()
    FROM Flight f
    JOIN FlightStatistics fs
        ON f.FlightStatistics_stat_id = fs.stat_id
    WHERE fs.delay_minutes > 0;

END;
$$;


-- Execute Procedure

CALL GenerateDelayReport();


-- Display Procedure Result

SELECT
    'PROCEDURE RESULT' AS Result_Title,
    report_id,
    flight_id,
    flight_number,
    delay_minutes,
    report_date
FROM DelayReport;



-- EVENT
-- Not implemented
-- According to assignment instructions,
-- events are not required in PostgreSQL.