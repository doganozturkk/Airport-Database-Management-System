# Name: Dogan Ozturk
# Student ID: 1002781671
# Title: Airport Database
# Assignment: Task 2

-- DATABASE

CREATE DATABASE IF NOT EXISTS airport_db;
USE airport_db;

-- USERS

CREATE USER IF NOT EXISTS 'dogan'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON airport_db.* TO 'dogan'@'localhost';

CREATE USER IF NOT EXISTS 'readonly'@'%' IDENTIFIED BY '1234';
GRANT SELECT ON *.* TO 'readonly'@'%';

FLUSH PRIVILEGES;

-- DISABLE FK CHECKS

SET FOREIGN_KEY_CHECKS = 0;

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
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(45)
);

CREATE TABLE Floor (
    floor_id INT AUTO_INCREMENT PRIMARY KEY,
    floor_number INT
);

CREATE TABLE EstablishmentType (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(45)
);

CREATE TABLE Airport (
    airport_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    city VARCHAR(45),
    country VARCHAR(45)
);

CREATE TABLE Shift (
    shift_id INT AUTO_INCREMENT PRIMARY KEY,
    shift_name VARCHAR(45)
);

CREATE TABLE Position (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(45)
);

CREATE TABLE Duration (
    duration_id INT AUTO_INCREMENT PRIMARY KEY,
    hours INT
);

CREATE TABLE Airline (
    airline_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45)
);

CREATE TABLE Schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE
);

CREATE TABLE FlightStatistics (
    stat_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_count INT,
    baggage_count INT,
    delay_minutes INT,
    flight_status VARCHAR(45)
);

CREATE TABLE Pricing (
    pricing_id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10,2),
    Duration_duration_id INT
);

CREATE TABLE ParkingLot (
    parking_lot_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    Pricing_pricing_id INT,
    Airport_airport_id INT
);

CREATE TABLE ParkingSection (
    section_id INT AUTO_INCREMENT PRIMARY KEY,
    section_name VARCHAR(45),
    ParkingLot_parking_lot_id INT
);

CREATE TABLE Establishment (
    establishment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    EstablishmentType_type_id INT,
    Location_location_id INT,
    Floor_floor_id INT,
    Airport_airport_id INT
);

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45),
    surname VARCHAR(45),
    Position_position_id INT,
    Shift_shift_id INT
);

CREATE TABLE Employment (
    employment_id INT AUTO_INCREMENT PRIMARY KEY,
    salary INT,
    hire_date DATE,
    education_level VARCHAR(45),
    Employee_employee_id INT
);

CREATE TABLE EmployeeEstablishment (
    employee_establishment_id INT AUTO_INCREMENT PRIMARY KEY,
    Employee_employee_id INT,
    Establishment_establishment_id INT
);

CREATE TABLE Gate (
    gate_id INT AUTO_INCREMENT PRIMARY KEY,
    gate_number VARCHAR(45),
    terminal VARCHAR(45),
    Airport_airport_id INT
);

CREATE TABLE Flight (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(45),
    departure_time DATETIME,
    arrival_time DATETIME,
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
REFERENCES `Position`(position_id);

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

-- ENABLE FK CHECKS

SET FOREIGN_KEY_CHECKS = 1;

-- INSERT DATA (BASE TABLES)

INSERT INTO Airport (name, city, country) VALUES
('Istanbul Airport','Istanbul','Turkey'),
('Frankfurt Airport','Frankfurt','Germany'),
('Heathrow Airport','London','UK'),
('Dubai International','Dubai','UAE'),
('Charles de Gaulle','Paris','France');

INSERT INTO Position (position_name) VALUES
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
('TK101','2026-06-20 08:00:00','2026-06-20 10:00:00',1,1,1,1,1),
('LH202','2026-06-21 09:00:00','2026-06-21 11:30:00',2,1,2,2,2),
('FR303','2026-06-22 10:00:00','2026-06-22 12:00:00',3,2,3,3,3),
('EK404','2026-06-23 11:00:00','2026-06-23 14:00:00',4,2,4,4,4),
('QR505','2026-06-24 12:00:00','2026-06-24 15:00:00',5,3,5,5,5),
('TK606','2026-06-25 13:00:00','2026-06-25 15:00:00',1,3,6,6,6),
('LH707','2026-06-26 14:00:00','2026-06-26 16:30:00',2,4,7,7,7),
('FR808','2026-06-27 15:00:00','2026-06-27 17:00:00',3,4,8,8,8),
('EK909','2026-06-28 16:00:00','2026-06-28 19:00:00',4,5,9,9,9),
('QR010','2026-06-29 17:00:00','2026-06-29 20:00:00',5,5,10,10,10);

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
SELECT * FROM Position;
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