CREATE TABLE employee (
    employee_id VARCHAR2(10 CHAR),
    first_name VARCHAR2(50 CHAR),
    last_name VARCHAR2(50 CHAR),
    employee_position varchar2(50 CHAR),
    phone_number VARCHAR2(15 CHAR),
    CONSTRAINT employee_pk PRIMARY KEY (employee_id)
);

CREATE TABLE customer (
    customer_id VARCHAR2(10 CHAR),
    first_name VARCHAR2(50 CHAR),
    last_name VARCHAR2(50 CHAR),
    phone_number VARCHAR2(15 CHAR),
    CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);

CREATE TABLE bus (
    bus_id VARCHAR2(10 CHAR),
    bus_number VARCHAR2(8 CHAR),
    seating_capacity NUMBER DEFAULT 50,
    employee_id VARCHAR2(10 CHAR)UNIQUE,
    CONSTRAINT bus_pk PRIMARY KEY (bus_id),
    CONSTRAINT bus_employee_fk FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE bus_trip (
    bus_trip_id VARCHAR2(10 CHAR),
    departure_location VARCHAR2(50 CHAR),
    bt_destination VARCHAR2(50 CHAR),
    departure DATE,
    bus_id varchar2(10 CHAR) UNIQUE,
    CONSTRAINT bus_trip_pk PRIMARY KEY (bus_trip_id),
    CONSTRAINT bus_trip_bus_fk FOREIGN KEY (bus_id) REFERENCES bus (bus_id) ON DELETE SET NULL,
    CONSTRAINT unique_bus_departure UNIQUE (bus_id, departure)
);

CREATE TABLE ticket_type (
    ticket_type_id VARCHAR2(10 CHAR),
    ticket_type VARCHAR2(50 CHAR),
    CONSTRAINT ticket_type_pk PRIMARY KEY (ticket_type_id)
);

CREATE TABLE ticket (
    ticket_id VARCHAR2(10 CHAR),
    ticket_destination VARCHAR2(50 CHAR),
    price NUMBER(10,2),
    ticket_type_id VARCHAR2(10 CHAR),
    CONSTRAINT ticket_pk PRIMARY KEY (ticket_id),
    CONSTRAINT ticket_ticket_type_fk FOREIGN KEY (ticket_type_id) REFERENCES ticket_type (ticket_type_id)
);

CREATE TABLE reservation (
    reservation_id VARCHAR2(10 CHAR),
    seat_number NUMBER CHECK (seat_number BETWEEN 1 AND 50),
    reservation_date DATE,
    employee_id varchar2(10 CHAR),
    customer_id varchar2(10 CHAR),
    bus_trip_id varchar2(10 CHAR),
    ticket_id varchar2(10 CHAR),
    CONSTRAINT reservation_pk PRIMARY KEY (reservation_id),
    CONSTRAINT reservation_employee_fk FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    CONSTRAINT reservation_customer_fk FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT reservation_bus_trip_fk FOREIGN KEY (bus_trip_id) REFERENCES bus_trip (bus_trip_id),
    CONSTRAINT reservation_ticket_fk FOREIGN KEY (ticket_id) REFERENCES ticket (ticket_id) ON DELETE CASCADE,
    CONSTRAINT unique_seat_number_bus_trip UNIQUE (seat_number, bus_trip_id)
);
