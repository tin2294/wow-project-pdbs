-- Insert data into vclass
INSERT INTO vclass (classid, class_name, daily_rate, daily_mileage, overage_rate)
VALUES
(1, 'Sedan Electric', 50.00, 400, 5),
(2, 'Small SUV Electric', 70.00, 300, 4.25),
(3, 'Large SUV Electric', 80.00, 320, 7.25),
(4, 'Sedan Hybrid', 60.00, 230, 6.25),
(5, 'Sedan Diesel', 55.00, 400, 4.25),
(6, 'Standard Sedan', 40.00, 300, 3.25),
(7, 'Small SUV Standard', 65.00, 500, 3.25),
(8, 'Large SUV Standard', 75.00, 500, 6.25),
(9, 'Small SUV Hybrid', 63.00, 300, 5.25),
(10, 'Large SUV Hybrid', 73.00, 340, 5.50),
(11, 'Small SUV Diesel', 60.00, 400, 4.50),
(12, 'Large SUV Diesel', 70.00, 420, 5.25),
(13, 'Standard Van', 80.00, 600, 5.25),
(14, 'Hybrid Van', 85.00, 500, 7.25),
(15, 'Electric Van', 90.00, 400, 6.25),
(16, 'Diesel Van', 78.00, 600, 5.00),
(17, 'Standard RV', 120.00, 670, 8.25),
(18, 'Standard Motorcycle', 68.00, 230, 3.25),
(19, 'Standard Truck', 100.00, 1000, 6.25),
(20, 'Electric Convertible', 90.00, 500, 7.25),
(21, 'Standard Convertible', 80.00, 550, 6.25),
(22, 'Hybrid Convertible', 86.00, 400, 8.25);

-- Insert data into office
INSERT INTO office (office_id, address_houseno, address_street, address_state, address_city, address_zipcode, phone)
VALUES
(1, 122, 'Clinton St', 'NY', 'New York', '10111', '6175555678'),
(2, 123, 'Clinton Ave', 'MA', 'Boston', '11122', '6175555673'),
(3, 222, 'Broadway', 'CA', 'San Diego', '11001', '6175555699'),
(4, 121, 'Houston', 'CA', 'Los Angeles', '12001', '6225555678'),
(5, 111, 'Lafayette', 'CA', 'San Francisco', '13001', '6175553378'),
(6, 100, '2nd Ave', 'NY', 'New York', '14001', '6111555678'),
(7, 802, '1st Ave', 'MA', 'Cambridge', '15001', '6172255678'),
(8, 86, 'Spring St', 'NY', 'New York', '16001', '6175000078'),
(9, 96, 'Canal St', 'NY', 'New York', '20001', '6122200078'),
(10, 322, '3rd Ave', 'NY', 'New York', '12201', '4175555678'),
(11, 223, '4th Ave', 'NY', 'New York', '30001', '5175555678'),
(12, 110, '5th Ave', 'NY', 'New York', '33001', '1175555678'),
(13, 220, 'Myrtle Ave', 'NY', 'New York', '33301', '7775555678'),
(14, 394, 'Dekalb Ave', 'NY', 'New York', '40001', '8875555678'),
(15, 203, 'Fulton St', 'NY', 'New York', '41001', '9175555678'),
(16, 506, 'Atlantic Ave', 'NY', 'New York', '32401', '9995555678'),
(17, 504, 'Willoughby', 'NY', 'New York', '55001', '9000055678'),
(18, 199, 'Court St', 'NY', 'New York', '66001', '6175577778'),
(19, 394, 'Wall St', 'NY', 'New York', '77001', '3123556780'),
(20, 449, 'Vanderbilt St', 'NY', 'New York', '88001', '3003556780'),
(21, 594, 'Tillary St', 'MA', 'Boston', '99001', '3232356780')
;

-- Insert data into vehicle
INSERT INTO vehicle (vehicle_id, vin, make, model, year, lp_state, lp_number, classid, office_id)
VALUES
(1, 'NYC123456789', 'Toyota', 'Camry', 2022, 'MA', 'ABC111', 1, 1),
(2, 'NIV123456789', 'Hyundai', 'Tucson', 2020, 'NY', 'ABC222', 2, 2),
(3, 'VIN121256789', 'Mercedes', 'G450', 2019, 'CA', 'ABC333', 3, 3),
(4, 'VIN123423789', 'BMW', 'X6', 2018, 'CA', 'BBB123', 8, 4),
(5, 'VIN123456733', 'Ford', 'F150', 2019, 'NY', 'CCC113', 13, 5),
(6, 'VIN123456709', 'Audi', 'Q3', 2020, 'CA', 'ABC100', 12, 6),
(7, 'VIN123456700', 'Volkswagen', 'Golf', 2020, 'VT', 'ABD000', 4, 9),
(8, 'VIN003456789', 'BMW', 'X4', 2023, 'CO', 'DAA121', 7, 10),
(9, 'VIN133456789', 'Ford', 'Explorer', 2023, 'CA', 'LAL123', 9, 7),
(10, 'VIN123456229', 'Nissan', 'Qasqai', 2020, 'NY', 'LLL123', 10, 11),
(11, 'VIN123411189', 'Yamaha', 'R6', 2019, 'IL', 'PAD123', 18, 18),
(12, 'VIN123333389', 'IVECO', 'Standard', 2021, 'CA', 'QRT123', 19, 15),
(13, 'VTN121256789', 'Lexus', 'LS500', 2020, 'CA', 'SVT123', 2, 14),
(14, 'VIN111406789', 'Infiniti', 'G6', 2021, 'IL', 'TRS111', 4, 15),
(15, 'VIN123400009', 'Mercedes', 'GLE Coupe', 2023, 'CO', 'TRS222', 8, 12),
(16, 'VIN000000789', 'BMW', 'X1', 2021, 'CA', 'DMD292', 7, 8),
(17, 'VIN122233789', 'Audi', 'A6', 2018, 'MA', 'DMR300', 6, 10);

-- Insert data into customer
INSERT INTO customer (cust_id, address_houseno, address_street, address_state, address_city, address_zipcode, phone, cust_type)
VALUES
  (2, 123, 'Main Street', 'CA', 'Los Angeles', '90001', '1239801234', 'C'),
  (3, 456, 'Oak Avenue', 'NY', 'New York', '10001', '5678905678', 'C'),
  (4, 789, 'Pine Road', 'TX', 'Houston', '77001', '6789012345', 'C'),
  (5, 101, 'Maple Lane', 'FL', 'Miami', '33101', '7890123456', 'C'),
  (6, 202, 'Cedar Street', 'IL', 'Chicago', '60601', '8901234567', 'C'),
  (7, 303, 'Birch Avenue', 'AZ', 'Phoenix', '85001', '9012345678', 'C'),
  (8, 404, 'Sycamore Lane', 'PA', 'Philadelphia', '19101', '0123456789', 'C'),
  (9, 505, 'Willow Street', 'GA', 'Atlanta', '30301', '1234567890', 'C'),
  (10, 606, 'Elm Road', 'CO', 'Denver', '80201', '2345678901', 'C'),
  (11, 707, 'Juniper Lane', 'WA', 'Seattle', '98101', '3456789012', 'C'),
  (12, 808, 'Redwood Avenue', 'MA', 'Boston', '02101', '4567890123', 'C'),
  (13, 909, 'Hickory Street', 'NV', 'Las Vegas', '89101', '5678901234', 'C'),
  (14, 101, 'Cypress Lane', 'OR', 'Portland', '97201', '6789012345', 'C'),
  (15, 202, 'Cherry Road', 'MI', 'Detroit', '48201', '7890123456', 'C'),
  (16, 303, 'Walnut Avenue', 'OH', 'Columbus', '43201', '8901234567', 'C'),
  (17, 404, 'Poplar Lane', 'NC', 'Charlotte', '28201', '9012345678', 'C'),
  (18, 505, 'Palm Street', 'IN', 'Indianapolis', '46201', '0123456789', 'C'),
  (19, 606, 'Spruce Road', 'TN', 'Nashville', '37201', '1234567890', 'C'),
  (20, 707, 'Bamboo Lane', 'MO', 'St. Louis', '63101', '2345678901', 'C'),
  (21, 808, 'Acacia Avenue', 'WI', 'Milwaukee', '53201', '3456789012', 'C'),
  (22, 909, 'Beech Lane', 'CA', 'San Francisco', '94101', '4567890123', 'I'),
  (23, 101, 'Daisy Street', 'TX', 'Austin', '73301', '5678901234', 'I'),
  (24, 202, 'Eucalyptus Avenue', 'NY', 'Buffalo', '14201', '6789012345', 'I'),
  (25, 303, 'Fern Road', 'FL', 'Tampa', '33601', '7890123456', 'I'),
  (26, 404, 'Grove Lane', 'IL', 'Peoria', '61601', '8901234567', 'I'),
  (27, 505, 'Hazel Street', 'AZ', 'Tucson', '85701', '9012345678', 'I'),
  (28, 606, 'Ivy Lane', 'PA', 'Pittsburgh', '15201', '0123456789', 'I'),
  (29, 707, 'Jasmine Road', 'GA', 'Savannah', '31401', '1234567890', 'I'),
  (30, 808, 'Lavender Avenue', 'CO', 'Boulder', '80301', '2345678901', 'I'),
  (31, 909, 'Magnolia Lane', 'CA', 'San Diego', '92101', '3456789012', 'I'),
  (32, 101, 'Narcissus Street', 'TX', 'Dallas', '75201', '4567890123', 'I'),
  (33, 202, 'Orchid Road', 'NY', 'Albany', '12201', '5678901234', 'I'),
  (34, 303, 'Peony Avenue', 'FL', 'Jacksonville', '32201', '6789012345', 'I'),
  (35, 404, 'Quince Lane', 'IL', 'Springfield', '62701', '7890123456', 'I');

-- Insert data into discount
INSERT INTO discount (discid, percentage, disc_type)
VALUES
(2, 0.15, 'I'),
(3, 0.20, NULL),
(4, 0.25, 'I'),
(5, 0.30, NULL),
(6, 0.35, 'I'),
(7, 0.40, NULL),
(8, 0.45, 'I'),
(9, 0.50, NULL),
(10, 0.55, 'I'),
(11, 0.60, NULL),
(12, 0.65, 'I'),
(13, 0.70, NULL),
(14, 0.75, 'I'),
(15, 0.80, NULL),
(16, 0.85, 'I'),
(17, 0.90, NULL),
(18, 0.95, 'I'),
(19, 0.20, NULL),
(20, 0.05, 'I'),
(21, 0.10, NULL),
(22, 0.15, 'I'),
(23, 0.20, NULL),
(24, 0.25, 'I'),
(25, 0.30, NULL),
(26, 0.35, 'I'),
(27, 0.40, NULL),
(28, 0.45, 'I'),
(29, 0.50, NULL),
(30, 0.55, 'I');

-- Insert data into corp_cust
INSERT INTO corp_cust (cust_id, company_name, company_no, emp_id, discid)
VALUES
(2, 'Apple', 'ABC124', 10101, 3),
(3, 'Samsung', 'ABC125', 10102, 4),
(4, 'NYU', 'BCD123', 10103, 5),
(5, 'Target', 'BCD124', 10104, 6),
(6, 'Nestle', 'BCD125', 10105, 7),
(7, 'McDonalds', 'CDE123', 10106, 8),
(8, 'CAVA', 'CDE124', 10107, 9),
(9, 'Panera', 'CDE125', 10108, 10),
(10, 'Best Buy', 'CDE126', 10109, 11),
(11, 'Trader Joes', 'EFG123', 10110, 12),
(12, 'Disney', 'EFG124', 10111, 13),
(13, 'Costco', 'EFG125', 10112, 14),
(14, 'CVS', 'EFG126', 10113, 15),
(15, 'Walgreens', 'FGH123', 10114, 16),
(16, 'Chipotle', 'CDE130', 10115, 17),
(17, 'VISA', 'EFG130', 10116, 18),
(18, 'Mastercard', 'EFG131', 10117, 19),
(19, 'Coldstone', 'EFG132', 10118, 20),
(20, 'Morgenstern', 'EFG140', 10019, 21),
(21, 'ABC Co', 'ABC123', 10100, 2);

-- Insert data into indiv_cust
INSERT INTO indiv_cust (cust_id, fname, lname, licenseno, insurance_co, insurancep_no)
VALUES
(22, 'Samuel', 'White', 'XYZ987', 'ABC Insurance', '654321'),
(23, 'Avery', 'Hall', 'LMN654', 'PQR Insurance', '987654'),
(24, 'Evelyn', 'Baker', 'ABC321', 'XYZ Insurance', '456789'),
(25, 'Jackson', 'Ross', 'DEF654', 'ABC Insurance', '321098'),
(26, 'Lily', 'Watson', 'GHI987', 'XYZ Insurance', '876543'),
(27, 'Gabriel', 'Perry', 'JKL321', 'PQR Insurance', '543210'),
(28, 'Scarlett', 'Fisher', 'MNO654', 'ABC Insurance', '210987'),
(29, 'Logan', 'Cruz', 'PQR987', 'XYZ Insurance', '876543'),
(30, 'Aria', 'Ward', 'STU321', 'ABC Insurance', '543210'),
(31, 'Lucas', 'Fletcher', 'VWX654', 'PQR Insurance', '210987'),
(32, 'Zoe', 'Hansen', 'YZA987', 'XYZ Insurance', '876543'),
(33, 'Leo', 'Reyes', 'HIJ321', 'ABC Insurance', '543210'),
(34, 'Hazel', 'Ortega', 'NOP654', 'PQR Insurance', '210987'),
(35, 'Mason', 'Schmidt', 'QRS987', 'XYZ Insurance', '876543');
;

-- Insert data into individual_disc
INSERT INTO individual_disc (discid, start_date, end_date, cust_id)
VALUES
(2, '2023-02-02', '2023-03-01', 22),
(4, '2023-03-02', '2023-04-01', 22),
(6, '2023-04-02', '2023-05-01', 23),
(8, '2023-05-02', '2023-06-01', 24),
(10, '2023-06-02', '2023-07-01', 25),
(12, '2023-07-02', '2023-08-01', 26),
(16, '2023-08-02', '2023-09-01', 27),
(18, '2023-09-02', '2023-10-01', 28),
(20, '2023-10-02', '2023-11-01', 28),
(22, '2023-11-02', '2023-12-01', 29),
(24, '2023-12-02', '2024-01-01', 30),
(26, '2024-01-02', '2024-02-01', 31),
(28, '2024-02-02', '2024-03-01', 33),
(30, '2024-03-02', '2024-04-01', 35);

-- Insert data into rental_service
INSERT INTO rental_service (service_id, pickup_street, pickup_state, pickup_country, pickup_zipcode, pickup_date, dropoff_date, start_odometer, end_odometer, vehicle_id, cust_id)
VALUES
(2, 'Maple Avenue', 'NY', 'USA', '10001', '2023-01-16', '2023-01-21', 1100, 1300, 2, 3),
(3, 'Cedar Lane', 'TX', 'USA', '75001', '2023-01-17', '2023-01-22', 1200, 1400, 3, 24),
(4, 'Pine Road', 'FL', 'USA', '33101', '2023-01-18', '2023-01-23', 1300, 1500, 4, 5),
(5, 'Birch Street', 'CA', 'USA', '90003', '2023-01-19', '2023-01-24', 1400, 1600, 5, 6),
(6, 'Cherry Avenue', 'WA', 'USA', '98101', '2023-01-20', '2023-01-25', 1500, 1700, 6, 27),
(7, 'Willow Lane', 'IL', 'USA', '60601', '2023-01-21', '2023-01-26', 1600, 1800, 7, 8),
(8, 'Elm Street', 'CO', 'USA', '80202', '2023-01-22', '2023-01-27', 1700, 1900, 8, 9),
(9, 'Juniper Road', 'AZ', 'USA', '85001', '2023-01-23', '2023-01-28', 1800, 2000, 9, 10),
(10, 'Spruce Lane', 'OR', 'USA', '97201', '2023-01-24', '2023-01-29', 1900, 2100, 10, 30),
(11, 'Cypress Avenue', 'NV', 'USA', '89101', '2023-01-25', '2023-01-30', 2000, 2200, 11, 12),
(12, 'Acacia Road', 'UT', 'USA', '84101', '2023-01-26', '2023-01-31', 2100, 2300, 12, 13),
(13, 'Hickory Street', 'NC', 'USA', '28201', '2023-01-27', '2023-02-01', 2200, 2400, 13, 31),
(14, 'Aspen Lane', 'GA', 'USA', '30301', '2023-01-28', '2023-02-02', 2300, 2500, 14, 15),
(15, 'Poplar Avenue', 'PA', 'USA', '19101', '2023-01-29', '2023-02-03', 2400, 2600, 15, 32),
(16, 'Walnut Road', 'MI', 'USA', '48201', '2023-01-30', '2023-02-04', 2500, 2700, 16, 17),
(17, 'Chestnut Lane', 'OH', 'USA', '43201', '2023-01-31', '2023-02-05', 2600, 2800, 17, 18),
(18, 'Sycamore Avenue', 'VA', 'USA', '23201', '2023-02-01', '2023-02-06', 2700, 2900, 3, 33),
(19, 'Redwood Street', 'NJ', 'USA', '07001', '2023-02-02', '2023-02-07', 2800, 3000, 4, 28),
(20, 'Oakwood Lane', 'MA', 'USA', '02101', '2023-02-03', '2023-02-08', 2900, 3100, 5, 21)
;

-- Insert data into invoice
INSERT INTO invoice (invoice_id, invoice_date, service_id)
VALUES
(2, '2023-01-16', 2),
(3, '2023-01-17', 3),
(4, '2023-01-18', 4),
(5, '2023-01-19', 5),
(6, '2023-01-20', 6),
(7, '2023-01-21', 7),
(8, '2023-01-22', 8),
(9, '2023-01-23', 9),
(10, '2023-01-24', 10),
(11, '2023-01-25', 11),
(12, '2023-01-26', 12),
(13, '2023-01-27', 13),
(14, '2023-01-28', 14),
(15, '2023-01-29', 15),
(16, '2023-01-30', 16),
(17, '2023-01-31', 17),
(18, '2023-02-01', 18),
(19, '2023-02-02', 19),
(20, '2023-02-03', 20);

-- Insert data into inv_disc
INSERT INTO inv_disc (invoice_id, discid)
VALUES
(2, 2),
(3, 13),
(14, 3),
(12, 4),
(8, 5),
(7, 6),
(6, 7),
(9, 6),
(18, 8),
(16, 9),
(15, 10),
(19, 12),
(20, 11)
;

-- Insert data into payment
INSERT INTO payment (payment_id, card_number, payment_method, invoice_id)
VALUES
(2, '2345678901234567', 'D', 2),
(3, '3456789012345678', 'C', 2),
(4, '4567890123456789', 'G', 3),
(5, '5678901234567890', 'C', 4),
(6, '6789012345678901', 'D', 5),
(7, '7890123456789012', 'C', 6),
(8, '8901234567890123', 'G', 7),
(9, '9012345678901234', 'C', 8),
(10, '0123456789012345', 'D', 9),
(11, '1234567890123456', 'C', 10),
(12, '2345678901234567', 'G', 11),
(13, '3456789012345678', 'C', 12),
(14, '4567890123456789', 'D', 13),
(15, '5678901234567890', 'C', 14),
(16, '6789012345678901', 'G', 15),
(17, '7890123456789012', 'C', 16),
(18, '8901234567890123', 'D', 17),
(19, '9012345678901234', 'C', 18),
(20, '0123456789012345', 'G', 19),
(21, '1234567890123456', 'C', 20),
(22, '2345678901234567', 'D', 19),
(23, '3456789012345678', 'C', 7),
(24, '4567890123456789', 'G', 18),
(25, '5678901234567890', 'C', 20);

