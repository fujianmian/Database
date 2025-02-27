CREATE TABLE CustomerInfo(
	CustomerID varchar(50) Primary key,
	Customer_FirstName varchar(50),
	Customer_LastName varchar(50),
	Customer_Phone varchar(50)
);
--这个第一个执行
SELECT * FROM CustomerInfo
DROP TABLE CustomerInfo

CREATE TABLE BusOperatorInfo(
	BusOperatorID varchar(50) Primary Key,
	Bus_Operator_Name varchar(50),
	Bus_Operator_Phone varchar(50)
);
--这个第二个执行
SELECT * FROM BusOperatorInfo
DROP TABLE BusOperatorInfo

CREATE TABLE RouteInfo(
	RouteID varchar(50) Primary Key,
	Class varchar(50),
	Departure_Date date,
	--Departure_Month varchar(50),
	--Departure_Year int,
	Departure_Station varchar(50),
	Destination_Station varchar(50),
	Status varchar(50),
	Departure_Time time,
	Duration_hours int,
	Bus_OperatorID varchar(50),
	FOREIGN KEY (Bus_OperatorID) REFERENCES BusOperatorInfo(BusOperatorID)
);
--这个第三个执行
SELECT * FROM RouteInfo
DROP TABLE RouteInfo

CREATE TABLE InvoiceDetails(
	TicketNumber varchar(50),
	Date_Reservation_Made date,
	--Month_Reservation_Made varchar(50),
	--Year_Reservation_Made int,
	Time_Reservation_Made time,
	RouteID varchar (50),
	--CstomerID varchar(50),
	--Total_Fee_For_The_InvoiceNumber int,
	CONSTRAINT PK_InvoiceDetails Primary Key(TicketNumber),
	FOREIGN KEY (RouteID) REFERENCES RouteInfo(RouteID)
	--Foreign key (TicketNumber) REFERENCES Fee(TicketNumber),
	--reign key (CustomerID) REFERENCES CustomerInfo(CustomerID)
);	
--这个第四个执行
SELECT * FROM InvoiceDetails
DROP TABLE InvoiceDetails

CREATE TABLE Fee(
	CustomerID varchar(50),
	TicketNumber varchar(50),
	Fee_Of_The_Ticket int,
	CONSTRAINT PK_Fee Primary Key(CustomerID,TicketNumber),
	foreign key (CustomerID) references CustomerInfo(CustomerID),
	foreign key (TicketNumber) references InvoiceDetails(TicketNumber)
);
--这个是第五个执行
SELECT * FROM Fee
DROP TABLE Fee



Drop table InvoiceDetails,Fee,BusOperatorInfo,CustomerInfo,RouteInfo;




--开始输入资料
INSERT INTO CustomerInfo (CustomerID, Customer_FirstName, Customer_LastName, Customer_Phone)
values
('C001', 'Paxton', 'Low', '012-8765432'),
('C002', 'Sakura', 'Tanaka', '012-8765426'),
('C003', 'Alex', 'Johnson', '012-8765421'),
('C004', 'Aisha', 'Khan', '012-8765427'),
('C005', 'Ibrahim', 'Abdi', '012-8765428'),
('C006', 'Fatima', 'Patel', '012-8765424'),
('C007', 'Jonathan', 'Lee', '012-3456793'),
('C008', 'Muthu', 'Thang', '012-3456794'),
('C009', 'Boogy', 'Tan', '012-3456795'),
('C010', 'Andrej', 'Novak', '012-8765425'),
('C011', 'Elena', 'Petrov', '012-8765429'),
('C012', 'Peggy', 'Elizabeth', '018-4561898'),
('C013', 'Wei', 'Li', '012-8765423'),
('C014', 'Juan', 'Chavez', '012-8765430'),
('C015', 'Mei', 'Chan', '012-8765431'),
('C016', 'Perkins', 'Loong', '012-3456798'),
('C017', 'Peggy', 'Geh', '012-3456799'),
('C018', 'William', 'Chan', '012-3456796'),
('C019', 'Maria', 'Gonzalez', '012-8765422'),
('C020', 'Brooks', 'Low', '012-3456792'),
('C021', 'Jessies', 'Zhang', '012-3456797'),
('C022', 'James', 'Heng', '012-3456790'),
('C023', 'Yosef', 'Lim', '012-3456791'),
('C024', 'Sparrow', 'Jack', '017-4031562'),
('C025', 'Dorsey', 'Johnson', '010-4652475'),
('C026', 'Jihoo', 'Kim', '012-4541548'),
('C027', 'Lim', 'Ivan', '013-7984652'),
('C028', 'Booker', 'Jacksom', '017-4561865'),
('C029', 'Jun', 'Lim', '012-1234567'),
('C030', 'Elvin', 'Low', '012-1234568'),
('C031', 'Le', 'Heng', '012-1234569'),
('C032', 'Li', 'Low', '012-1234570');



INSERT INTO BusOperatorInfo (BusOperatorID, Bus_Operator_Name, Bus_Operator_Phone)
values
('E001','Rapid Bus', '015-2345678'),
('E002','Fast Bus', '015-2345679'),
('E003','Slow Bus', '015-2345680'),
('E004','AP Bus', '015-2345681'),
('E005','Top Bus', '015-2345682');


INSERT INTO RouteInfo (RouteID, Class, Departure_Date, Departure_Station, Destination_Station, Status, Departure_Time, Duration_hours, Bus_OperatorID)
values
('D001', 'Bussiness', '2024-2-4', 'Ipoh', 'Sekinchan', 'Domestic', '20:00:00', 4, 'E002'),
('D002', 'Economic', '2024-2-13', 'Sekinchan', 'Ipoh', 'Domestic', '09:00:00', 4, 'E002'),
('D003', 'Economic', '2024-2-15', 'Genting Highland', 'Ipoh', 'Domestic', '11:00:00', 3, 'E003'),
('D004', 'Economic', '2024-2-16', 'Pulau Pinang', 'Melaka', 'Domestic', '08:00:00', 6, 'E002'),
('D005', 'Economic', '2024-2-17', 'Kampar', 'Pulau Pinang', 'Domestic', '17:00:00', 5, 'E004'),
('D006', 'Economic', '2024-2-18', 'Johor', 'Melaka', 'Domestic', '12:00:00', 2, 'E004'),
('D007', 'Economic', '2024-2-18', 'Kedah', 'Betong', 'Overseas', '18:00:00', 4, 'E005'),
('D008', 'Economic', '2024-2-20', 'Perlis', 'Betong', 'Overseas', '15:00:00', 2, 'E005'),
('D009', 'Bussiness', '2024-2-21', 'Genting Highland', 'KL Sentral', 'Domestic', '12:00:00', 3, 'E005'),
('D010', 'Bussiness', '2024-2-23', 'Ipoh', 'Sekinchan', 'Domestic', '17:00:00', 4, 'E002'),
('D011', 'Bussiness', '2024-2-24', 'Ipoh', 'Sekinchan', 'Domestic', '12:00:00', 5, 'E002'),
('D012', 'Economic', '2024-2-25', 'Pulau Pinang', 'KL Sentral', 'Domestic', '20:00:00', 6, 'E004'),
('D013', 'Economic', '2024-2-26', 'Ipoh', 'Sekinchan', 'Domestic', '20:00:00', 4, 'E002'),
('D014', 'Bussiness', '2024-2-27', 'Sekinchan', 'KL Sentral', 'Domestic', '11:00:00', 3, 'E001'),
('D015', 'Bussiness', '2024-2-28', 'KL Sentral', 'Pulau Pinang', 'Domestic', '17:00:00', 5, 'E004'),
('D016', 'Bussiness', '2024-3-1', 'Pulau Pinang', 'Betong', 'Overseas', '15:00:00', 4, 'E005'),
('D017', 'Bussiness', '2024-11-15', 'Johor', 'Melaka', 'Domestic', '12:00:00', 5, 'E002'),
('D018', 'Bussiness', '2024-11-17', 'Genting Highland', 'KL Sentral', 'Domestic', '12:00:00', 2, 'E001'),
('D019', 'Bussiness', '2024-11-30', 'Ipoh', 'Sekinchan', 'Domestic', '15:00:00', 3, 'E002'),
('D020', 'Bussiness', '2024-12-1', 'Pulau Pinang', 'KL Sentral', 'Domestic', '07:00:00', 5, 'E003'),
('D021', 'Economic', '2024-12-12', 'KL Sentral', 'Lumut', 'Domestic', '08:00:00', 4, 'E001'),
('D022', 'Economic', '2024-12-14', 'KL Sentral', 'Lumut', 'Domestic', '08:00:00', 4, 'E001'),
('D023', 'Economic', '2024-12-14', 'Johor', 'KL Sentral', 'Domestic', '09:00:00', 4, 'E004'),
('D024', 'Economic', '2024-12-20', 'Melaka', 'Johor', 'Domestic', '07:00:00', 5, 'E002'),
('D025', 'Economic', '2024-12-20', 'Genting Highland', 'KL Sentral', 'Domestic', '12:00:00', 2, 'E001'),
('D026', 'Economic', '2024-12-21', 'Lumut', 'KL Sentral', 'Domestic', '08:00:00', 4, 'E005'),
('D027', 'Economic', '2024-12-21', 'Ipoh', 'Sekinchan', 'Domestic', '12:00:00', 3, 'E001'),
('D028', 'Economic', '2024-12-28', 'Pulau Pinang', 'KL Sentral', 'Domestic', '07:00:00', 5, 'E003');


INSERT INTO InvoiceDetails(TicketNumber, Date_Reservation_Made, Time_Reservation_Made, RouteID)
Values
('B1001', '2023-2-28', '11:00:00', 'D014'),('B1002', '2023-2-28', '11:00:00', 'D015'),
('B1003', '2023-2-28', '11:00:00', 'D016'),('B1004', '2023-2-1', '17:00:00', 'D009'),
('B1005', '2023-2-17', '13:00:00', 'D005'),('B1006', '2023-2-23', '18:00:00', 'D010'),
('B1007', '2023-2-23', '18:00:00', 'D010'),('B1008', '2023-2-28', '14:00:00', 'D007'),
('B1009', '2023-2-28', '14:30:00', 'D019'),('B1010', '2023-2-28', '14:30:00', 'D019'),
('B1011', '2023-2-28', '14:30:00', 'D019'),('B1012', '2024-2-10', '11:40:00', 'D003'),
('B1013', '2023-2-21', '16:00:00', 'D008'),('B1014', '2024-2-1', '14:20:00', 'D002'),
('B1015', '2024-2-2', '20:00:00', 'D011'),('B1016', '2024-3-5', '16:45:00', 'D002'),
('B1017', '2024-11-4', '19:30:00', 'D001'),('B1018', '2024-11-19', '11:00:00', 'D006'),
('B1019', '2024-11-3', '21:00:00', 'D012'),('B1020', '2024-12-12', '15:00:00', 'D004'),
('B1021', '2024-12-4', '22:00:00', 'D013'),('B1022', '2024-12-17', '15:00:00', 'D005'),
('B1023', '2024-12-17', '15:00:00', 'D005'),('B1024', '2024-12-11', '15:00:00', 'D006'),
('B1025', '2024-12-30', '09:00:00', 'D021'),('B1026', '2024-12-3', '08:00:00', 'D016'),
('B1027', '2024-12-31', '20:00:00', 'D006'),('B1028', '2024-12-28', '18:00:00', 'D006'),
('B1029', '2024-2-4', '19:30:00', 'D001'),('B1030', '2024-2-18', '13:00:00', 'D016'),
('B1031', '2024-3-15', '14:00:00', 'D021'),('B1032', '2024-11-17', '11:30:00', 'D018'),
('B1033', '2024-12-15', '17:00:00', 'D025'),('B1034', '2024-2-18', '11:40:00', 'D006'),
('B1035', '2024-2-18', '12:00:00', 'D005'),('B1036', '2024-11-15', '11:30:00', 'D017'),
('B1037', '2024-12-1', '06:30:00', 'D020'),('B1038', '2024-12-12', '07:30:00', 'D021'),
('B1039', '2024-4-13', '12:00:00', 'D021'),('B1040', '2024-12-12', '07:15:00', 'D021'),
('B1041', '2024-12-12', '07:15:00', 'D021'),('B1042', '2024-12-12', '07:15:00', 'D022'),
('B1043', '2024-12-16', '15:00:00', 'D026'),('B1044', '2024-2-17', '22:00:00', 'D016'),
('B1045', '2024-2-22', '10:00:00', 'D016'),('B1046', '2024-2-18', '11:45:00', 'D006'),
('B1047', '2024-12-21', '11:45:00', 'D027'),('B1048', '2024-2-18', '11:30:00', 'D006'),
('B1049', '2024-12-13', '09:00:00', 'D023'),('B1050', '2024-2-18', '11:35:00', 'D006'),
('B1051', '2024-12-13', '11:00:00', 'D024'),('B1052', '2024-12-21', '11:50:00', 'D027'),
('B1053', '2024-2-18', '11:25:00', 'D006'),('B1054', '2024-12-17', '11:00:00', 'D027'),
('B1055', '2024-12-17', '11:00:00', 'D027'),('B1056', '2024-12-21', '11:25:00', 'D027'),
('B1057', '2024-2-18', '11:25:00', 'D006'),('B1058', '2024-12-19', '19:00:00', 'D028'),
('B1059', '2024-12-21', '11:20:00', 'D027'),('B1060', '2024-2-18', '11:20:00', 'D006'),
('B1061', '2024-12-20', '15:00:00', 'D028');


INSERT INTO Fee(CustomerID, TicketNumber, Fee_Of_The_Ticket)
Values
('C001', 'B1001', 20),('C001', 'B1002', 20),('C001', 'B1003', 60),('C002', 'B1004', 20),
('C003', 'B1005', 30),('C004', 'B1006', 20),('C005', 'B1007', 20),('C006', 'B1008', 60),
('C007', 'B1009', 30),('C008', 'B1010', 30),('C009', 'B1011', 30),('C009', 'B1012', 25),
('C010', 'B1013', 60),('C011', 'B1014', 20),('C011', 'B1015', 20),('C012', 'B1016', 25),
('C012', 'B1017', 20),('C013', 'B1018', 30),('C014', 'B1019', 30),('C014', 'B1020', 60),
('C015', 'B1021', 20),('C016', 'B1022', 20),('C017', 'B1023', 20),('C017', 'B1024', 30),
('C017', 'B1025', 60),('C017', 'B1026', 60),('C017', 'B1027', 30),('C018', 'B1028', 30),
('C018', 'B1029', 20),('C018', 'B1030', 60),('C018', 'B1031', 60),('C018', 'B1032', 20),
('C018', 'B1033', 20),('C018', 'B1034', 30),('C019', 'B1035', 30),('C020', 'B1036', 32),
('C021', 'B1037', 32),('C022', 'B1038', 20),('C023', 'B1039', 20),('C023', 'B1040', 20),
('C023', 'B1041', 60),('C023', 'B1042', 40),('C023', 'B1043', 60),('C023', 'B1044', 60),
('C023', 'B1045', 30),('C023', 'B1046', 30),('C023', 'B1047', 30),('C024', 'B1048', 30),
('C024', 'B1049', 40),('C025', 'B1050', 30),('C025', 'B1051', 32),('C026', 'B1052', 30),
('C026', 'B1053', 30),('C026', 'B1054', 30),('C026', 'B1055', 30),('C027', 'B1056', 30),
('C027', 'B1057', 30),('C027', 'B1058', 32),('C028', 'B1059', 30),('C028', 'B1060', 30),
('C028', 'B1061', 32);

--student 1(Lim Jun Siong)
--Q1
SELECT BusOperatorID, Bus_Operator_Name
FROM BusOperatorInfo
WHERE BusOperatorID = (
		SELECT Bus_OperatorID
		FROM RouteInfo
		Group BY Bus_OperatorID
		ORDER BY COUNT(*) DESC
		LIMIT 1);
	
--Q2
SELECT Customer_FirstName, Customer_LastName
FROM CustomerInfo
WHERE CustomerID = (
		SELECT CustomerID
		FROM InvoiceDetails
		GROUP BY CustomerID
		ORDER BY COUNT (*) DESC
		LIMIT 1 )
LIMIT 1 ;
	
--Q3
SELECT *
FROM RouteInfo
JOIN (
    SELECT RouteID,
           COUNT(*) AS Reservation_Count
    FROM InvoiceDetails
    GROUP BY RouteID 
    ORDER BY Reservation_Count DESC
    LIMIT 1
) AS PopularRoute
ON RouteInfo.RouteID = PopularRoute.RouteID;

--Q4
SELECT Departure_Station, Destination_Station,Departure_Time,
	COUNT(*) As Bus_Count
FROM RouteInfo
GROUP BY Departure_Station, Destination_Station, Departure_Time
ORDER BY Bus_Count DESC;

--student 2(Lim Li Feng)
--Q1
SELECT Customer_FirstName, Customer_LastName,count_Customer FROM CustomerInfo
JOIN(SELECT COUNT(CustomerID)
	AS count_Customer, CustomerID
	FROM Fee
	GROUP BY CustomerID
	HAVING COUNT(CUstomerID)>1)
AS subquery ON CustomerInfo.CustomerID = subquery.CustomerID

--Q2
SELECT DISTINCT bo.BusOperatorID, bo.Bus_Operator_Name
FROM RouteInfo AS r1
JOIN RouteInfo AS r2 on r1.Departure_Station = r2.Departure_Station
					 AND r1.Destination_Station = r2.Destination_Station
					 AND not (r1.RouteID = r2.RouteID)--排除同一路线的比较
JOIN BusOperatorInfo AS bo ON r1.Bus_OperatorID = bo.BusOperatorID
WHERE r1.Departure_Date BETWEEN '2024-02-01' AND '2024-02-29'
AND r2.Departure_Date BETWEEN '2024-02-01'  AND '2024-02-29';

--Q3
SELECT BusOperatorID, Bus_Operator_Name, total_Count_Route, Route_Departure, Route_Destination
FROM BusOperatorInfo
JOIN (SELECT COUNT(Bus_OperatorID) AS total_Count_Route, Bus_OperatorID,
	 	 		  Departure_Station AS Route_Departure,
	 			  Destination_Station AS Route_Destination
	 FROM RouteInfo
	 Group BY Bus_OperatorID, Departure_Station, Destination_Station )
AS subquery ON BusOperatorInfo.BusOperatorID = subquery.Bus_OperatorID

--Q4
SELECT COUNT (Bus_OperatorID) AS total_Count_Route, Bus_OperatorID,
	   Departure_Station AS Route_Departure,
	   Destination_Station AS Route_Destination
FROM RouteInfo
GROUP BY Bus_OperatorID, Departure_Station, Destination_Station
ORDER BY total_Count_Route ASC


--student 3(Heng Jun Yong)
--Q1 (D016)
SELECT RouteInfo.RouteID, RouteInfo.Class
FROM RouteInfo
JOIN (
    SELECT RouteID
    FROM InvoiceDetails
    GROUP BY RouteID
    ORDER BY COUNT(*) DESC
) AS MostFrequentRoute
ON RouteInfo.RouteID = MostFrequentRoute.RouteID
WHERE RouteInfo.Class = 'Bussiness'
LIMIT 1;

--Q2 (C029, C030, C031, C032)
SELECT * FROM CustomerInfo
where not exists (Select CustomerID from Fee where CustomerInfo.CustomerID = Fee.CustomerID)
ORDER BY CustomerID Desc;

--Q3 ()
SELECT 
    RouteInfo.RouteID, 
    RouteInfo.Bus_OperatorID, 
    BusOperatorInfo.Bus_Operator_Name,
    COUNT(*) AS Num_Of_Route
FROM 
    RouteInfo
JOIN 
    BusOperatorInfo ON RouteInfo.Bus_OperatorID = BusOperatorInfo.BusOperatorID
GROUP BY 
    RouteInfo.RouteID, 
    RouteInfo.Bus_OperatorID,
    BusOperatorInfo.Bus_Operator_Name
Order by
	RouteID asc;



--Q4
SELECT 
	RouteInfo.RouteID, RouteInfo.Departure_Date, 
	RouteInfo.Departure_Station, RouteInfo.Destination_Station, 
	RouteInfo.Departure_Time, RouteInfo.Duration_hours, COUNT(*) AS SeatsSold
FROM InvoiceDetails
JOIN RouteInfo ON InvoiceDetails.RouteID = RouteInfo.RouteID
WHERE 
	--Condition 1: Same date
    (InvoiceDetails.Date_Reservation_Made = RouteInfo.Departure_Date AND
    EXTRACT(HOUR FROM RouteInfo.Departure_Time) * 60 + EXTRACT(MINUTE FROM RouteInfo.Departure_Time) - 
	(EXTRACT(HOUR FROM InvoiceDetails.Time_Reservation_Made) * 60 + EXTRACT(MINUTE FROM InvoiceDetails.Time_Reservation_Made))
	BETWEEN 0 AND 60)
    OR
	--Condition 2: Different Date, reservation date early one day than departure date
    (InvoiceDetails.Date_Reservation_Made = RouteInfo.Departure_Date - INTERVAL '1 day' AND
    EXTRACT(HOUR FROM RouteInfo.Departure_Time) * 60 + EXTRACT(MINUTE FROM RouteInfo.Departure_Time) - 
	(EXTRACT(HOUR FROM InvoiceDetails.Time_Reservation_Made) * 60 + EXTRACT(MINUTE FROM InvoiceDetails.Time_Reservation_Made))
	BETWEEN 1380 AND 1440)
GROUP BY 
	RouteInfo.RouteID, RouteInfo.Departure_Date, 
	RouteInfo.Departure_Station, RouteInfo.Destination_Station, 
	RouteInfo.Departure_Time, RouteInfo.Duration_hours
ORDER BY SeatsSold DESC

--student 4(Low Teng Fong)
-- Q1
SELECT 
	Bus_OperatorID,
    Bus_Operator_Name,
    EXTRACT(MONTH FROM Date_Reservation_Made)AS Month,
	EXTRACT(YEAR FROM Date_Reservation_Made)AS Year,
    SUM(Fee.Fee_Of_The_Ticket) AS TotalSales,
    COUNT(InvoiceDetails.TicketNumber) AS TotalSeatsSold
FROM 
    InvoiceDetails
JOIN 
    RouteInfo ON InvoiceDetails.RouteID = RouteInfo.RouteID
JOIN 
    BusOperatorInfo ON RouteInfo.Bus_OperatorID = BusOperatorInfo.BusOperatorID
JOIN 
    Fee ON InvoiceDetails.TicketNumber = Fee.TicketNumber
GROUP BY 
    Month, Year, Bus_OperatorID, Bus_Operator_Name
ORDER BY 
    TotalSales DESC, TotalSeatsSold DESC;

-- Q2
SELECT
	Bus_OperatorID,
	Bus_Operator_Name,
	COUNT (InvoiceDetails.TicketNumber) AS TotalSeatsSold
FROM 
	InvoiceDetails
JOIN 
    RouteInfo ON InvoiceDetails.RouteID = RouteInfo.RouteID
JOIN 
    BusOperatorInfo ON RouteInfo.Bus_OperatorID = BusOperatorInfo.BusOperatorID
JOIN 
    Fee ON InvoiceDetails.TicketNumber = Fee.TicketNumber
WHERE
	Bus_OperatorID NOT IN (
        SELECT 
            RouteInfo.Bus_OperatorID
        FROM 
            RouteInfo
        JOIN 
            InvoiceDetails ON RouteInfo.RouteID = InvoiceDetails.RouteID
        GROUP BY 
            RouteInfo.Bus_OperatorID
        HAVING 
            COUNT(InvoiceDetails.TicketNumber) IN (120, 210)
    )
GROUP BY 
    Bus_OperatorID, Bus_Operator_Name
ORDER BY
	TotalSeatsSold ASC;

-- Q3
Select
	Customer_FirstName,
	Customer_LastName,
	RouteInfo.Departure_Date,
	InvoiceDetails.Date_Reservation_Made	
FROM
	CustomerInfo
JOIN
	Fee ON CustomerInfo.CustomerID = Fee.CustomerID
JOIN
	InvoiceDetails ON Fee.TicketNumber = InvoiceDetails.TicketNumber
JOIN
    RouteInfo ON InvoiceDetails.RouteID = RouteInfo.RouteID
WHERE 
	(RouteInfo.Departure_Date - InvoiceDetails.Date_Reservation_Made) >= (90);

-- Q4
SELECT 
	DISTINCT BusOperatorID,
	Bus_Operator_Name AS DomesticBusOperator
FROM 
	BusOperatorInfo
JOIN
	RouteInfo ON BusOperatorInfo.BusOperatorID = RouteInfo.Bus_OperatorID
WHERE
	RouteInfo.status = 'Domestic';