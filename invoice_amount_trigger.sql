-- TRIGGER: Invoice Amount
DELIMITER //
CREATE TRIGGER INVOICE_AMOUNT_INSERT BEFORE
    INSERT ON invoice
    FOR EACH ROW
BEGIN
    DECLARE rental_days INT;
    DECLARE daily_mileage DECIMAL(10, 2);    
    DECLARE mile_limit DECIMAL(10, 2);
    DECLARE miles_driven DECIMAL(10,2);
    DECLARE daily_rate DECIMAL(10, 2);
    DECLARE overage_rate DECIMAL(10, 2);
    DECLARE total_amount DECIMAL(10, 2);

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
    SELECT rs.end_odometer, rs.start_odometer INTO miles_driven
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

    -- Calculate the total amount
    IF miles_driven <= mile_limit THEN
        SET total_amount = miles_driven * daily_rate;
    ELSE
        SET total_amount = (miles_driven - mile_limit) * overage_rate + mile_limit * daily_rate;
    END IF;

    -- Update the corresponding invoice record
    UPDATE invoice
    SET amount = total_amount
    WHERE service_id = NEW.service_id;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER INVOICE_AMOUNT_UPDATE BEFORE
    UPDATE ON invoice
    FOR EACH ROW
BEGIN
    DECLARE rental_days INT;
	DECLARE odometer_limit DECIMAL(10, 2);
    DECLARE mile_limit DECIMAL(10, 2);
    DECLARE miles_driven DECIMAL(10,2);
    DECLARE daily_rate DECIMAL(10, 2);
    DECLARE overage_rate DECIMAL(10, 2);
    DECLARE total_amount DECIMAL(10, 2);

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
    SELECT rs.end_odometer, rs.start_odometer INTO miles_driven
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

    -- Calculate the total amount
    IF miles_driven <= mile_limit THEN
        SET total_amount = miles_driven * daily_rate;
    ELSE
        SET total_amount = (miles_driven - mile_limit) * overage_rate + mile_limit * daily_rate;
    END IF;

    -- Update the corresponding invoice record
    UPDATE invoice
    SET amount = total_amount
    WHERE service_id = NEW.service_id;
END //
DELIMITER ;
