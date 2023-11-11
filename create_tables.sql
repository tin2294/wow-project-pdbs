-- SQLINES DEMO *** le SQL Developer Data Modeler 23.1.0.087.0806
-- SQLINES DEMO *** -11-09 15:42:33 EST
-- SQLINES DEMO *** le Database 21c
-- SQLINES DEMO *** le Database 21c



-- SQLINES DEMO *** no DDL - MDSYS.SDO_GEOMETRY

-- SQLINES DEMO *** no DDL - XMLTYPE

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE corp_cust (
    cust_id      BIGINT NOT NULL COMMENT 'Customer ID',
    company_name VARCHAR(30) NOT NULL COMMENT 'Name of the company',
    company_no   VARCHAR(30) NOT NULL COMMENT 'Registration number of company',
    emp_id       BIGINT NOT NULL COMMENT 'ID of the employee',
    discid       BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN corp_cust.cust_id IS
    'Customer ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN corp_cust.company_name IS
    'Name of the company'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN corp_cust.company_no IS
    'Registration number of company'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN corp_cust.emp_id IS
    'ID of the employee'; */

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX corp_cust__idx ON
    corp_cust (
        discid
    ASC );

ALTER TABLE corp_cust ADD CONSTRAINT corp_cust_pk PRIMARY KEY ( cust_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE corp_disc (
    discid BIGINT NOT NULL COMMENT 'Discount Coupon ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN corp_disc.discid IS
    'Discount Coupon ID'; */

ALTER TABLE corp_disc ADD CONSTRAINT corp_disc_pk PRIMARY KEY ( discid );

--  Customers
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE customer (
    cust_id         BIGINT NOT NULL COMMENT 'Customer ID',
    address_houseno BIGINT NOT NULL COMMENT 'House Number in Address',
    address_street  VARCHAR(30) NOT NULL COMMENT 'Street name in Address',
    address_state   VARCHAR(2) NOT NULL COMMENT 'State name in Address',
    address_city    VARCHAR(30) NOT NULL COMMENT 'City name in Address',
    address_zipcode VARCHAR(5) NOT NULL COMMENT 'Zipcode of address',
    phone           VARCHAR(10) NOT NULL COMMENT 'PHONE NUMBER',
    cust_type       VARCHAR(1) NOT NULL COMMENT 'Type of Customer'
);

ALTER TABLE customer
    ADD CONSTRAINT ch_inh_customer CHECK ( cust_type IN ( 'C', 'I' ) );

ALTER TABLE customer COMMENT
    'Customers';

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.cust_id IS
    'Customer ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.address_houseno IS
    'House Number in Address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.address_street IS
    'Street name in Address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.address_state IS
    'State name in Address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.address_city IS
    'City name in Address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.address_zipcode IS
    'Zipcode of address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.phone IS
    'PHONE NUMBER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN customer.cust_type IS
    'Type of Customer'; */

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_id );

--  Discount coupons
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE discount (
    discid     BIGINT NOT NULL COMMENT 'Discount Coupon ID',
    percentage DECIMAL(7, 2) NOT NULL COMMENT 'Percentage of discount in decimals',
    disc_type  VARCHAR(1) NOT NULL COMMENT 'Type of Discount'
);

ALTER TABLE discount
    ADD CONSTRAINT ch_inh_discount CHECK ( disc_type IN ( 'C', 'I' ) );

ALTER TABLE discount COMMENT
    'Discount coupons';

/* Moved to CREATE TABLE
COMMENT ON COLUMN discount.discid IS
    'Discount Coupon ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN discount.percentage IS
    'Percentage of discount in decimals'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN discount.disc_type IS
    'Type of Discount'; */

ALTER TABLE discount ADD CONSTRAINT discount_pk PRIMARY KEY ( discid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE indiv_cust (
    cust_id       BIGINT NOT NULL COMMENT 'Customer ID',
    fname         VARCHAR(30) NOT NULL COMMENT 'First Name of individual customer',
    lname         VARCHAR(30) NOT NULL COMMENT 'Last Name of Individual Customer',
    licenseno     VARCHAR(15) NOT NULL COMMENT 'Licence Number of Individual customer',
    insurance_co  VARCHAR(30) NOT NULL COMMENT 'Insurance company name',
    insurancep_no VARCHAR(30) NOT NULL COMMENT 'Insurance policy number'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN indiv_cust.cust_id IS
    'Customer ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN indiv_cust.fname IS
    'First Name of individual customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN indiv_cust.lname IS
    'Last Name of Individual Customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN indiv_cust.licenseno IS
    'Licence Number of Individual customer'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN indiv_cust.insurance_co IS
    'Insurance company name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN indiv_cust.insurancep_no IS
    'Insurance policy number'; */

ALTER TABLE indiv_cust ADD CONSTRAINT indiv_cust_pk PRIMARY KEY ( cust_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE individual_disc (
    discid     BIGINT NOT NULL COMMENT 'Discount Coupon ID',
    start_date DATETIME NOT NULL COMMENT 'Start date of validity of coupon',
    end_date   DATETIME NOT NULL COMMENT 'End date of validity of coupon',
    cust_id    BIGINT
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN individual_disc.discid IS
    'Discount Coupon ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN individual_disc.start_date IS
    'Start date of validity of coupon'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN individual_disc.end_date IS
    'End date of validity of coupon'; */

ALTER TABLE individual_disc ADD CONSTRAINT individual_disc_pk PRIMARY KEY ( discid );

-- SQLINES DEMO *** invoice discount
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE inv_disc (
    invoice_id BIGINT COMMENT 'Invoice ID',
    discid     BIGINT COMMENT 'Discount ID'
);

ALTER TABLE inv_disc COMMENT
    'Associate Table invoice discount';

/* Moved to CREATE TABLE
COMMENT ON COLUMN inv_disc.invoice_id IS
    'Invoice ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN inv_disc.discid IS
    'Discount ID'; */

--  Invoices
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE invoice (
    invoice_id BIGINT NOT NULL COMMENT 'Invoice ID',
    `DATE`     DATETIME NOT NULL COMMENT 'Invoice date',
    service_id INT NOT NULL
);

ALTER TABLE invoice COMMENT
    'Invoices';

/* Moved to CREATE TABLE
COMMENT ON COLUMN invoice.invoice_id IS
    'Invoice ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN invoice."DATE" IS
    'Invoice date'; */

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( invoice_id );

--  Rental offices
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE office (
    office_id       BIGINT NOT NULL COMMENT 'Rental Office ID',
    address_houseno BIGINT NOT NULL COMMENT 'Number of house in address',
    address_street  VARCHAR(30) NOT NULL COMMENT 'Street name of address',
    address_state   VARCHAR(2) NOT NULL COMMENT 'State of the address abbreviated',
    address_city    VARCHAR(30) NOT NULL COMMENT 'City of address',
    address_zipcode VARCHAR(5) NOT NULL COMMENT 'Zipcode of address',
    phone           VARCHAR(10) NOT NULL COMMENT 'Phone of office'
);

ALTER TABLE office COMMENT
    'Rental offices';

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.office_id IS
    'Rental Office ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.address_houseno IS
    'Number of house in address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.address_street IS
    'Street name of address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.address_state IS
    'State of the address abbreviated'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.address_city IS
    'City of address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.address_zipcode IS
    'Zipcode of address'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN office.phone IS
    'Phone of office'; */

ALTER TABLE office ADD CONSTRAINT office_pk PRIMARY KEY ( office_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE payment (
    payment_id     BIGINT NOT NULL COMMENT 'Payment ID',
    card_number    VARCHAR(20) NOT NULL COMMENT 'Card number (for gift, credit or debit card)',
    payment_method VARCHAR(1) NOT NULL COMMENT 'Payment method, which can only be G, C, D',
    invoice_id     BIGINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN payment.payment_id IS
    'Payment ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN payment.card_number IS
    'Card number (for gift, credit or debit card)'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN payment.payment_method IS
    'Payment method, which can only be G, C, D'; */

ALTER TABLE payment ADD CONSTRAINT payment_pk PRIMARY KEY ( payment_id );

--  Rental services
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE rental_service (
    service_id     INT NOT NULL COMMENT 'Service ID',
    pickup_street  VARCHAR(30) NOT NULL COMMENT 'Pick up street name',
    pickup_state   VARCHAR(2) NOT NULL COMMENT 'State of pickup (abbreviated)',
    pickup_country VARCHAR(30) NOT NULL COMMENT 'Country of pickup',
    pickup_zipcode VARCHAR(5) NOT NULL COMMENT 'Zip code of pickup',
    pickup_date    DATETIME NOT NULL COMMENT 'Pickup date',
    dropoff_date   DATETIME NOT NULL COMMENT 'Drop off date',
    start_odometer BIGINT NOT NULL COMMENT 'Starting odometer read',
    end_odometer   BIGINT NOT NULL COMMENT 'End odometer read',
    odometer_limit BIGINT NOT NULL COMMENT 'Odometer limit',
    vehicle_id     BIGINT,
    cust_id        BIGINT
);

ALTER TABLE rental_service COMMENT
    'Rental services';

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.service_id IS
    'Service ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.pickup_street IS
    'Pick up street name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.pickup_state IS
    'State of pickup (abbreviated)'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.pickup_country IS
    'Country of pickup'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.pickup_zipcode IS
    'Zip code of pickup'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.pickup_date IS
    'Pickup date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.dropoff_date IS
    'Drop off date'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.start_odometer IS
    'Starting odometer read'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.end_odometer IS
    'End odometer read'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN rental_service.odometer_limit IS
    'Odometer limit'; */

ALTER TABLE rental_service ADD CONSTRAINT rental_service_pk PRIMARY KEY ( service_id );

--  Vehicle classes
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE vclass (
    classid       BIGINT NOT NULL COMMENT 'Vehicle Class ID',
    class_name    VARCHAR(30) NOT NULL COMMENT 'Vehicle class name',
    daily_rate    DECIMAL(7, 2) NOT NULL COMMENT 'Daily rate of vehicle class',
    daily_mileage BIGINT NOT NULL COMMENT 'Daily mileage of vehicle class',
    overage_rate  DECIMAL(7, 2) NOT NULL COMMENT 'Overage rate for vehicle class'
);

ALTER TABLE vclass COMMENT
    'Vehicle classes';

/* Moved to CREATE TABLE
COMMENT ON COLUMN vclass.classid IS
    'Vehicle Class ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vclass.class_name IS
    'Vehicle class name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vclass.daily_rate IS
    'Daily rate of vehicle class'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vclass.daily_mileage IS
    'Daily mileage of vehicle class'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vclass.overage_rate IS
    'Overage rate for vehicle class'; */

ALTER TABLE vclass ADD CONSTRAINT vclass_pk PRIMARY KEY ( classid );

--  Vehicles
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE vehicle (
    vehicle_id BIGINT NOT NULL COMMENT 'ID Number of Vehicle',
    vin        VARCHAR(30) NOT NULL COMMENT 'Vehicle Identification Number',
    make       VARCHAR(30) NOT NULL COMMENT 'Make of vehicle',
    model      VARCHAR(30) NOT NULL COMMENT 'Model of vehicle',
    year       DOUBLE NOT NULL COMMENT 'Year of the car',
    lp_state   VARCHAR(2) NOT NULL COMMENT 'License Plate State (abbreviated)',
    lp_number  VARCHAR(8) NOT NULL COMMENT 'License Plate number',
    classid    BIGINT NOT NULL,
    office_id  BIGINT NOT NULL
);

ALTER TABLE vehicle COMMENT
    'Vehicles';

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.vehicle_id IS
    'ID Number of Vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.vin IS
    'Vehicle Identification Number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.make IS
    'Make of vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.model IS
    'Model of vehicle'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.year IS
    'Year of the car'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.lp_state IS
    'License Plate State (abbreviated)'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN vehicle.lp_number IS
    'License Plate number'; */

ALTER TABLE vehicle ADD CONSTRAINT vehicle_pk PRIMARY KEY ( vehicle_id );

ALTER TABLE corp_cust
    ADD CONSTRAINT corp_cust_corp_disc_fk FOREIGN KEY ( discid )
        REFERENCES corp_disc ( discid );

ALTER TABLE corp_cust
    ADD CONSTRAINT corp_cust_customer_fk FOREIGN KEY ( cust_id )
        REFERENCES customer ( cust_id );

ALTER TABLE corp_disc
    ADD CONSTRAINT corp_disc_discount_fk FOREIGN KEY ( discid )
        REFERENCES discount ( discid );

ALTER TABLE indiv_cust
    ADD CONSTRAINT indiv_cust_customer_fk FOREIGN KEY ( cust_id )
        REFERENCES customer ( cust_id );

ALTER TABLE individual_disc
    ADD CONSTRAINT individual_disc_discount_fk FOREIGN KEY ( discid )
        REFERENCES discount ( discid );

ALTER TABLE individual_disc
    ADD CONSTRAINT individual_disc_indiv_cust_fk FOREIGN KEY ( cust_id )
        REFERENCES indiv_cust ( cust_id );

ALTER TABLE inv_disc
    ADD CONSTRAINT inv_disc_discount_fk FOREIGN KEY ( discid )
        REFERENCES discount ( discid );

ALTER TABLE inv_disc
    ADD CONSTRAINT inv_disc_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES invoice ( invoice_id );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_rental_service_fk FOREIGN KEY ( service_id )
        REFERENCES rental_service ( service_id );

ALTER TABLE payment
    ADD CONSTRAINT payment_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES invoice ( invoice_id );

ALTER TABLE rental_service
    ADD CONSTRAINT rental_service_customer_fk FOREIGN KEY ( cust_id )
        REFERENCES customer ( cust_id );

ALTER TABLE rental_service
    ADD CONSTRAINT rental_service_vehicle_fk FOREIGN KEY ( vehicle_id )
        REFERENCES vehicle ( vehicle_id );

ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_office_fk FOREIGN KEY ( office_id )
        REFERENCES office ( office_id );

ALTER TABLE vehicle
    ADD CONSTRAINT vehicle_vclass_fk FOREIGN KEY ( classid )
        REFERENCES vclass ( classid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY

-- FIRST TRIGGER: individual customer and customer super type
DELIMITER //
CREATE TRIGGER arc_fkarc_3_indiv_cust_insert BEFORE
	INSERT on indiv_cust
    FOR EACH ROW
BEGIN
    DECLARE d CHAR(1);

    SELECT a.cust_type INTO d
    FROM customer a
    WHERE a.cust_id = NEW.cust_id;

    IF (d IS NULL OR d <> 'I') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK INDIV_CUST_CUSTOMER_FK in Table INDIV_CUST violates Arc constraint on Table CUSTOMER - discriminator column CUST_TYPE doesn''t have value ''I''';
    END IF;
END //
DELIMITER ;

-- FIRST TRIGGER: individual customer and customer super type
DELIMITER //
CREATE TRIGGER arc_fkarc_3_indiv_cust_update BEFORE
	UPDATE on indiv_cust
    FOR EACH ROW
BEGIN
    DECLARE d CHAR(1);

    SELECT a.cust_type INTO d
    FROM customer a
    WHERE a.cust_id = NEW.cust_id;

    IF (d IS NULL OR d <> 'I') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK INDIV_CUST_CUSTOMER_FK in Table INDIV_CUST violates Arc constraint on Table CUSTOMER - discriminator column CUST_TYPE doesn''t have value ''I''';
    END IF;
END; //
DELIMITER ;



-- SQLINES LICENSE FOR EVALUATION USE ONLY

-- SECOND TRIGGER: corporate customers and customers
DELIMITER //

CREATE TRIGGER arc_fkarc_3_corp_cust_insert BEFORE
    INSERT ON corp_cust
    FOR EACH ROW

BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.cust_type
    INTO d
    FROM
        customer a
    WHERE
        a.cust_id = new.cust_id;

    IF ( d IS NULL OR d <> 'C' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK CORP_CUST_CUSTOMER_FK in Table CORP_CUST violates Arc constraint on Table CUSTOMER - discriminator column CUST_TYPE doesn''t have value ''C''';
    END IF;
END; //

DELIMITER ;

DELIMITER //

CREATE TRIGGER arc_fkarc_3_corp_cust_update BEFORE
    UPDATE ON corp_cust
    FOR EACH ROW

BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.cust_type
    INTO d
    FROM
        customer a
    WHERE
        a.cust_id = new.cust_id;

    IF ( d IS NULL OR d <> 'C' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK CORP_CUST_CUSTOMER_FK in Table CORP_CUST violates Arc constraint on Table CUSTOMER - discriminator column CUST_TYPE doesn''t have value ''C''';
    END IF;
END; //

DELIMITER ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY

-- THIRD TRIGGER: Individual discounts and discount supertype
DELIMITER //

CREATE TRIGGER arc_fkarc_4_individual_disc_insert BEFORE
    INSERT ON individual_disc
    FOR EACH ROW
BEGIN
    DECLARE d CHAR(1);

    SELECT a.disc_type INTO d
    FROM discount a
    WHERE a.discid = NEW.discid;

    IF (d IS NULL OR d <> 'I') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK INDIVIDUAL_DISC_DISCOUNT_FK in Table INDIVIDUAL_DISC violates Arc constraint on Table DISCOUNT - discriminator column DISC_TYPE doesn''t have value ''I''';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER arc_fkarc_4_individual_disc_update BEFORE
    UPDATE ON individual_disc
    FOR EACH ROW
BEGIN
    DECLARE d CHAR(1);

    SELECT a.disc_type INTO d
    FROM discount a
    WHERE a.discid = NEW.discid;

    IF (d IS NULL OR d <> 'I') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK INDIVIDUAL_DISC_DISCOUNT_FK in Table INDIVIDUAL_DISC violates Arc constraint on Table DISCOUNT - discriminator column DISC_TYPE doesn''t have value ''I''';
    END IF;
END //

DELIMITER ;


-- SQLINES LICENSE FOR EVALUATION USE ONLY

-- FOURTH TRIGGER: customer discounts and discount supertype
DELIMITER //
CREATE TRIGGER arc_fkarc_4_corp_disc_insert BEFORE
    INSERT ON corp_disc
    FOR EACH ROW
BEGIN
    DECLARE d CHAR(1);

    SELECT a.disc_type INTO d
    FROM discount a
    WHERE a.discid = NEW.discid;

    IF (d IS NULL OR d <> 'C') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK CORP_DISC_DISCOUNT_FK in Table CORP_DISC violates Arc constraint on Table DISCOUNT - discriminator column DISC_TYPE doesn''t have value ''C''';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER arc_fkarc_4_corp_disc_update BEFORE
    UPDATE ON corp_disc
    FOR EACH ROW
BEGIN
    DECLARE d CHAR(1);

    SELECT a.disc_type INTO d
    FROM discount a
    WHERE a.discid = NEW.discid;

    IF (d IS NULL OR d <> 'C') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK CORP_DISC_DISCOUNT_FK in Table CORP_DISC violates Arc constraint on Table DISCOUNT - discriminator column DISC_TYPE doesn''t have value ''C''';
    END IF;
END //
DELIMITER ;

-- SQLINES DEMO *** per Data Modeler Summary Report: 
-- 
-- SQLINES DEMO ***                        13
-- SQLINES DEMO ***                         1
-- SQLINES DEMO ***                        28
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** DY                      0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         4
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE                   0
-- SQLINES DEMO ***  TYPE BODY              0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** EGMENT                  0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** ED VIEW                 0
-- SQLINES DEMO *** ED VIEW LOG             0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO *** A                       0
-- SQLINES DEMO *** T                       0
-- 
-- SQLINES DEMO ***                         0
-- SQLINES DEMO ***                         0
