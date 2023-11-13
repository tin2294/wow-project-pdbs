-- Drop the existing trigger
DROP TRIGGER IF EXISTS INVOICE_AMOUNT_INSERT;

-- TRIGGER: Invoice Amount
DELIMITER //
CREATE TRIGGER INVOICE_AMOUNT_INSERT
    BEFORE INSERT ON invoice
    FOR EACH ROW
BEGIN
    DECLARE rental_days INT;
	DECLARE daily_mileage DECIMAL(10, 2);    
    DECLARE mile_limit DECIMAL(10, 2);
    DECLARE miles_driven DECIMAL(10,2);
    DECLARE daily_rate DECIMAL(10, 2);
    DECLARE overage_rate DECIMAL(10, 2);
    DECLARE total_amount DECIMAL(10, 2);
    DECLARE discount_percentage DECIMAL(7, 2);
    DECLARE invoice_id INT;

    -- Fetch the invoice_id based on the service_id from invoice
    SELECT invoice_id INTO invoice_id
    FROM invoice
    WHERE service_id = NEW.service_id
    LIMIT 1;

    -- Calculate rental days
    SELECT DATEDIFF(rs.dropoff_date, rs.pickup_date) INTO rental_days
    FROM rental_service rs
    WHERE rs.service_id = NEW.service_id;

    -- Get the daily_mileage from the vehicle_class table
    SELECT vc.daily_mileage INTO daily_mileage
    FROM vehicle v
    JOIN vclass vc ON v.classid = vc.classid
    WHERE v.vehicle_id = (SELECT vehicle_id FROM rental_service WHERE service_id = NEW.service_id);

    -- Get mile limit
    SET mile_limit = daily_mileage * rental_days;

    -- Calculate miles_driven
    SELECT rs.end_odometer - rs.start_odometer INTO miles_driven
    FROM rental_service rs
    WHERE rs.service_id = NEW.service_id;

    -- Get the daily rate from the vehicle_class table
    SELECT vc.daily_rate INTO daily_rate
    FROM vehicle v
    JOIN vclass vc ON v.classid = vc.classid
    WHERE v.vehicle_id = (SELECT vehicle_id FROM rental_service WHERE service_id = NEW.service_id);

    -- Get the overage rate from the vehicle_class table
    SELECT vc.overage_rate INTO overage_rate
    FROM vehicle v
    JOIN vclass vc ON v.classid = vc.classid
    WHERE v.vehicle_id = (SELECT vehicle_id FROM rental_service WHERE service_id = NEW.service_id);

    -- Get the discount percentage from the discount table
    SELECT percentage INTO discount_percentage
    FROM discount
    WHERE discid = (SELECT discid FROM inv_disc WHERE invoice_id = invoice_id);

    -- Calculate the total amount
    IF miles_driven <= mile_limit THEN
        SET total_amount = miles_driven * daily_rate * (1 - COALESCE(discount_percentage, 0));
    ELSE
        SET total_amount = ((miles_driven - mile_limit) * overage_rate + mile_limit * daily_rate) * (1 - COALESCE(discount_percentage, 0));
    END IF;
END //
DELIMITER ;

-- Drop the existing trigger
DROP TRIGGER IF EXISTS INVOICE_AMOUNT_UPDATE;

DELIMITER //
CREATE TRIGGER INVOICE_AMOUNT_UPDATE
    BEFORE UPDATE ON invoice
    FOR EACH ROW
BEGIN
    DECLARE rental_days INT;
	DECLARE daily_mileage DECIMAL(10, 2);    
    DECLARE mile_limit DECIMAL(10, 2);
    DECLARE miles_driven DECIMAL(10,2);
    DECLARE daily_rate DECIMAL(10, 2);
    DECLARE overage_rate DECIMAL(10, 2);
    DECLARE total_amount DECIMAL(10, 2);
    DECLARE discount_percentage DECIMAL(7, 2);
    DECLARE invoice_id INT;

    -- Fetch the invoice_id based on the service_id from invoice
    SELECT invoice_id INTO invoice_id
    FROM invoice
    WHERE service_id = NEW.service_id
    LIMIT 1;

    -- Calculate rental days
    SELECT DATEDIFF(rs.dropoff_date, rs.pickup_date) INTO rental_days
    FROM rental_service rs
    WHERE rs.service_id = NEW.service_id;

    -- Get the daily_mileage from the vehicle_class table
    SELECT vc.daily_mileage INTO daily_mileage
    FROM vehicle v
    JOIN vclass vc ON v.classid = vc.classid
    WHERE v.vehicle_id = (SELECT vehicle_id FROM rental_service WHERE service_id = NEW.service_id);

    -- Get mile limit
    SET mile_limit = daily_mileage * rental_days;

    -- Calculate miles_driven
    SELECT rs.end_odometer - rs.start_odometer INTO miles_driven
    FROM rental_service rs
    WHERE rs.service_id = NEW.service_id;

    -- Get the daily rate from the vehicle_class table
    SELECT vc.daily_rate INTO daily_rate
    FROM vehicle v
    JOIN vclass vc ON v.classid = vc.classid
    WHERE v.vehicle_id = (SELECT vehicle_id FROM rental_service WHERE service_id = NEW.service_id);

    -- Get the overage rate from the vehicle_class table
    SELECT vc.overage_rate INTO overage_rate
    FROM vehicle v
    JOIN vclass vc ON v.classid = vc.classid
    WHERE v.vehicle_id = (SELECT vehicle_id FROM rental_service WHERE service_id = NEW.service_id);

    -- Get the discount percentage from the discount table
    SELECT percentage INTO discount_percentage
    FROM discount
    WHERE discid = (SELECT discid FROM inv_disc WHERE invoice_id = invoice_id);

    -- Calculate the total amount
    IF miles_driven <= mile_limit THEN
        SET total_amount = miles_driven * daily_rate * (1 - COALESCE(discount_percentage, 0));
    ELSE
        SET total_amount = ((miles_driven - mile_limit) * overage_rate + mile_limit * daily_rate) * (1 - COALESCE(discount_percentage, 0));
    END IF;

END //
DELIMITER ;
