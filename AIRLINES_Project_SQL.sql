-- PROJECT AIRLINES -- JOLANTA DASZKIEWICZ

-- Create relational  DB of your choice with minimum 5 tables
-- Set Primary and Foreign Key constraints to create relations between the tables

CREATE DATABASE Airlines;
USE Airlines;

CREATE TABLE Airline (
AirlineID INT PRIMARY KEY,
AirlineIdentifier VARCHAR(10) NOT NULL,
AirlineName VARCHAR(30)
);

CREATE TABLE Airport (
AirportID INT PRIMARY KEY,
AirportName VARCHAR(55) NOT NULL,
IATA_code VARCHAR(10) NOT NULL,
Country VARCHAR(30) NOT NULL
);

CREATE TABLE Routes (
FlightNumber INT PRIMARY KEY,
OriginAirportID INT NOT NULL,
DestinationAirportID INT NOT NULL,
Distance INT,
CONSTRAINT fk_origin FOREIGN KEY (OriginAirportID)
					 REFERENCES Airport (AirportID),
CONSTRAINT fk_destination FOREIGN KEY (DestinationAirportID)
						REFERENCES Airport (AirportID)
                     );


CREATE TABLE Flights (
FlightNumber INT NOT NULL,
TailNumber VARCHAR(20) NOT NULL,
CONSTRAINT fk_flights FOREIGN KEY (FlightNumber)
					  REFERENCES Routes (FlightNumber)
                      );

CREATE TABLE Dates (
AirlineID INT NOT NULL,
FlightNumber INT NOT NULL,
Year DATE NOT NULL,
Month DATE NOT NULL,
Day DATE NOT NULL,
CONSTRAINT fk_airlineid FOREIGN KEY (AirlineID)
						REFERENCES Airline (AirlineID),
CONSTRAINT fk_flightid FOREIGN KEY (FlightNumber)
					   REFERENCES Routes (FlightNumber)
                       );

ALTER TABLE Dates
MODIFY COLUMN Year INT,
MODIFY COLUMN Month INT,
MODIFY COLUMN Day INT;

INSERT INTO Airline (
AirlineID, AirlineIdentifier, AirlineName)
VALUES 
	(1, 'AS', 'Alaska Airlines'),
    (2,	'AA', 'American Airlines'),
    (3,	'US', 'US Airways'),
    (4, 'DL', 'Delta Air Lines'),
    (5, 'NK', 'Spirit Airlines'),
    (6, 'UA', 'United Airlines'),
    (7, 'B6', 'JetBlue'),
    (8, 'OO', 'SkyWest Airlines'),
    (9, 'HA', 'Hawaiian Airlines'),
    (10, 'EV', 'ExpressJet');
    
INSERT INTO Airport (
AirportID, AirportName, IATA_code, Country)
VALUES 
	(21, 'Ted Stevens Anchorage International Airport', 'ANC', 'United States'),
    (22, 'Seattle-Tacoma International Airport', 'SEA', 'United States'),
    (23, 'Los Angeles International Airport', 'LAX','United States'),
	(24, 'Palm Beach International Airport', 'PBI','United States'),
    (25, 'San Francisco International Airport', 'SFO' ,'United States'),
    (26, 'Charlotte/Douglas International Airport', 'CLT','United States'),
    (27, 'Miami International Airport', 'MIA' ,'United States'),
    (28, 'Minneapolis-Saint Paul International Airport', 'MSP' ,'United States'),
	(29, 'Harry Reid International Airport', 'LAS' ,'United States'),     
	(30, 'Charlotte/Douglas International Airport', 'CLT' ,'United States'),
    (31, 'Dallas-Fort Worth International Airport', 'DFW' ,'United States'),
    (32, 'Hartsfield-Jackson Atlanta International Airport', 'ATL','United States'),
    (33, 'Denver International Airport', 'DEN' ,'United States'),
    (34, 'Salt Lake City International Airport', 'SLC' ,'United States'),
    (35, 'Ted Stevens Anchorage International Airport', 'ANC' ,'United States'),
    (36, 'George Bush Intercontinental Airport', 'IAH','United States'),
    (37, 'Portland International Airport', 'PDX','United States'),
    (38, 'Kansas City International Airport', 'MCI','United States');

INSERT INTO Routes (
FlightNumber, OriginAirportID, DestinationAirportID, Distance)
VALUES
	(98, 21, 22, 1448),
    (2336, 23, 24, 2330),
    (840, 25, 26, 2296),
    (258, 23, 27, 2342),
    (135, 22, 21, 1448),
    (806, 25, 28, 1589),
    (612, 29, 28, 1299),
    (2013, 23, 26, 2125),
    (1112, 25, 31, 1464),
    (1173, 29, 32, 1747),
    (1674, 29, 27, 2174),
    (1434, 23, 28, 1535),
    (2324, 34, 32, 1590),
    (2440, 22, 28, 1399),
    (108, 21, 22, 1448),
    (1560, 35, 22, 1448),
    (1197, 25, 36, 1635),
    (122, 35, 37, 1542),
    (1670, 37, 28, 1426),
    (520, 29, 38, 1139),
    (371, 22, 27, 2724),
    (214, 29, 31, 1055),
    (115, 23, 27, 2342);
    
 INSERT INTO Flights (
 FlightNumber, TailNumber)
 VALUES
	(98, 'N407AS'),
(2336, 'N3KUAA'),
(840, 'N171US'),
(258, 'N3HYAA'),
(135, 'N527AS'),
(806, 'N3730B'),
(612, 'N635NK'),
(2013, 'N584UW'),
(1112,	'N3LAAA'),
(1173, 'N826DN'),
(1674, 'N853AA'),
(1434,	'N547US'),
(2324,	'N3751B'),
(2440, 'N651DL'),
(108, 'N309AS'),
(1560, 'N3743H'),
(1197, 'N78448'),
(122, 'N413AS'),
(1670, 'N806DN'),
(520, 'N525NK'),
(371, 'N3GXAA'),
(214, 'N632NK'),
(115, 'N3CTAA');

INSERT INTO Dates (
AirlineID, FlightNumber, Year, Month, Day)
VALUES
(1, 98, 2015, 1, 5),
(2, 2336, 2015, 1, 23),
(3, 840, 2015, 2, 26),
(4, 612, 2015, 2, 5),
(1, 135, 2015, 3, 9),
(4, 806, 2015, 3, 17),
(5, 612, 2015, 4, 4),
(3, 2013, 2015, 4, 30),
(2, 1112, 2015, 5, 22),
(4, 1173, 2015, 5, 11),
(1, 1674, 2015, 6, 1),
(4, 1434, 2015, 7, 14),
(4, 2324, 2015, 7, 17),
(4, 2440, 2015, 8, 26),
(1, 108, 2015, 8, 29),
(10, 1560, 2015, 9, 2),
(9, 1197, 2015, 9, 7),
(8, 122, 2015, 10, 17),
(7, 1670, 2015, 10, 15),
(6, 520, 2015, 11, 9),
(10, 371, 2015, 11, 6),
(5, 214, 2015, 12, 30),
(2, 115, 2015, 12, 30);

-- Using any type of the joins create a view that combines multiple tables in a logical way
-- Created view shows info only about one airline called 'Alaska Airlines'

CREATE VIEW Alaska_Airline_view AS
	SELECT ae.AirlineName, ds.FlightNumber, at.AirportName AS OriginAirport, at1.AirportName AS DestinationAirport
	FROM Airline ae
	JOIN Dates ds
	ON ae.AirlineID = ds.AirlineID
		LEFT JOIN Routes rs
		ON ds.FlightNumber = rs.FlightNumber
			LEFT JOIN Airport at
			ON rs.OriginAirportID = at.AirportID
				LEFT JOIN Airport at1
				ON rs.DestinationAirportID = at1.AirportID
				WHERE ae.AirlineName LIKE 'Alaska Airlines';

-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis (ADVANCED)
-- A query uses Alaska_Airline_view to show flights that do not origine from Seattle airport

SELECT * FROM Alaska_Airline_view
WHERE OriginAirport != 'Seattle-Tacoma International Airport';

-- In your database, create a stored function that can be applied to a query in your DB
-- Based on the distance, my stored function declare if the flight is short-, medium- or long-haul.

SET DELIMITER //

DELIMITER //
CREATE FUNCTION declare_type (distance INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE haul_type VARCHAR(20);
	IF distance < 1500 THEN
    SET haul_type = 'Short-haul';
		ELSEIF (distance >= 1500 AND distance < 3500) THEN
        SET haul_type = 'Medium-haul';
			ELSEIF distance >= 3500 THEN
			SET haul_type = 'Long-haul';
            END IF;
	RETURN (haul_type);
	END//distance
	DELIMITER ;

SELECT flightnumber, declare_type(distance) AS Flight_length 
FROM routes
ORDER BY Flight_length DESC;

-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis 
-- I want to chceck which airpline(s) operated in month 9 (September) and what is their name and identifier

SELECT ae.AirlineID, ae.AirlineIdentifier, ae.AirlineName 
FROM airline ae
WHERE ae.AirlineID IN (
	SELECT ds.AirlineID
    FROM dates ds
	WHERE ds.Month = 9);
    
 -- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis  (ADVANCED)  
 -- A query counts average fligt distance and groups the result by the Origin Airport. Final result shows average flight distans shorter than 1500 km. 
 
 SELECT OriginAirportID,  ROUND(AVG(Distance), 0) AS Avgerage_flight_distance
 FROM routes
 GROUP BY OriginAirportID
 HAVING Avgerage_flight_distance < 1500
 ORDER BY Avgerage_flight_distance;
 
 -- In your database, create a trigger and demonstrate how it runs (ADVANCED)
 -- The trigger is supposed to automaticaly add status 'New airline' whenever the new airline is inseerted into the table 
 
 ALTER TABLE airline
 ADD COLUMN Status VARCHAR(20) AFTER AirlineName;

CREATE TRIGGER before_airline_insert
BEFORE INSERT ON airline
FOR EACH ROW 
SET NEW.status = 'New airline';

INSERT INTO airline
VALUES (11, 'MQ', 'American Eagle Airlines', NULL);

