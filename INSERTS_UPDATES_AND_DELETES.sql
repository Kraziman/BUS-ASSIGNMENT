-- Insert into employee table
INSERT INTO employee (employee_id, first_name, last_name, employee_position, phone_number)
VALUES ('&employee_id', '&first_name', '&last_name', '&employee_position', '&phone_number');

-- Insert into customer table
INSERT INTO customer (customer_id, first_name, last_name, phone_number)
VALUES ('&customer_id', '&first_name', '&last_name', '&phone_number');

-- Insert into bus table
INSERT INTO bus (bus_id, bus_number, employee_id)
VALUES ('&bus_id', '&bus_number', '&employee_id');

-- Insert into bus_trip table
INSERT INTO bus_trip (bus_trip_id, departure_location, bt_destination, departure, bus_id)
VALUES ('&bus_trip_id', '&departure_location', '&bt_destination', TO_TIMESTAMP('&departure', 'YYYY-MM-DD HH24:MI:SS'), '&bus_id');

-- Insert into ticket_type table
INSERT INTO ticket_type (ticket_type_id, ticket_type)
VALUES ('&ticket_type_id', '&ticket_type');

-- Insert into ticket table
INSERT INTO ticket (ticket_id, ticket_destination, price, ticket_type_id)
VALUES ('&ticket_id', '&ticket_destination', &price, '&ticket_type_id');

-- Insert into reservation table
INSERT INTO reservation (reservation_id, seat_number, reservation_date, employee_id, customer_id, bus_trip_id, ticket_id)
VALUES ('&reservation_id', &seat_number, TO_TIMESTAMP('&reservation_date', 'YYYY-MM-DD HH24:MI:SS'), '&employee_id', '&customer_id', '&bus_trip_id', '&ticket_id');




-- Update reservation information
UPDATE reservation
SET reservation_id = '999'
WHERE reservation_id = '1000';

-- Delete updated reservation record
DELETE FROM reservation
WHERE reservation_id = '999';

-- Update ticket information
UPDATE ticket
SET ticket_id = '999'
WHERE ticket_id = '1000';

-- Delete updated ticket record
DELETE FROM ticket
WHERE ticket_id = '999';

-- Update ticket_type information
UPDATE ticket_type
SET ticket_type_id = '999'
WHERE ticket_type_id = '1000';

-- Delete updated ticket_type record
DELETE FROM ticket_type
WHERE ticket_type_id = '999';

-- Update bus_trip information
UPDATE bus_trip
SET bus_trip_id = '999'
WHERE bus_trip_id = '1000';

-- Delete updated bus_trip record
DELETE FROM bus_trip
WHERE bus_trip_id = '999';

-- Update bus information
UPDATE bus
SET bus_id = '999'
WHERE bus_id = '1000';

-- Delete updated bus record
DELETE FROM bus
WHERE bus_id = '999';

-- Update customer information
UPDATE customer
SET customer_id = '999'
WHERE customer_id = '1000';

-- Delete updated customer record
DELETE FROM customer
WHERE customer_id = '999';

-- Update employee information
UPDATE employee
SET employee_id = '999'
WHERE employee_id = '1000';

-- Delete updated employee record
DELETE FROM employee
WHERE employee_id = '999';
