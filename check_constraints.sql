
-- Rental Service Constraints
-- Constraint: Pickup Date has to before or same day as Dropoff Date
ALTER TABLE rental_service
	ADD CONSTRAINT check_dropoff_after_pickup 
    CHECK (rental_service.dropoff_date >= rental_service.pickup_date);
    
-- Constraint: Start Odometer has to be < End Odometer
ALTER TABLE rental_service
	ADD CONSTRAINT check_odometer_start_and_end
    CHECK (rental_service.start_odometer < rental_service.end_odometer);

-- Constraint: Verify that start_odometer gte 0  
ALTER TABLE rental_service
	ADD CONSTRAINT check_start_odometer_gte_zero
    CHECK (rental_service.start_odometer >= 0);

-- Constraint: Verify that end_odometer gte 0
ALTER TABLE rental_service
	ADD CONSTRAINT check_end_odometer_gte_zero
    CHECK (rental_service.end_odometer >= 0);

-- Payment Constraints
-- Constraint: Value checking for payment_method
-- C: Credit, D: Debit, G: Gift
ALTER TABLE payment
	ADD CONSTRAINT payment_method_type_valid
    CHECK (payment.payment_method = 'C' OR payment.payment_method = 'D' OR payment.payment_method = 'G');
    
-- Discount Constraints
-- Constraint: Checking that for discount d, 0 <= d <= 1 (decimal)
ALTER TABLE discount
	ADD CONSTRAINT check_discount_is_decimal
    CHECK (discount.percentage >= 0 AND discount.percentage <= 1);
    

    
