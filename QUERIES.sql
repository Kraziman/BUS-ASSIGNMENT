--Tickets purchased by customer
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.ticket_id) AS ticket_count
FROM
    customer c
LEFT JOIN reservation r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name;


--Free seats for a specific destination
SELECT
    bt.bus_trip_id,
    bt.departure_location,
    bt.bt_destination,
    bt.departure,
    b.seating_capacity - COUNT(r.ticket_id) AS free_seats
FROM
    bus_trip bt
JOIN bus b ON bt.bus_id = b.bus_id
LEFT JOIN reservation r ON bt.bus_trip_id = r.bus_trip_id
WHERE
    bt.bt_destination = 'Sofia'
GROUP BY
    bt.bus_trip_id, bt.departure_location, bt.bt_destination, bt.departure, b.seating_capacity;


--Free seats for a specific date
SELECT
    bt.bus_trip_id,
    bt.departure_location,
    bt.bt_destination,
    bt.departure,
    b.seating_capacity - COUNT(r.ticket_id) AS free_seats
FROM
    bus_trip bt
JOIN bus b ON bt.bus_id = b.bus_id
LEFT JOIN reservation r ON bt.bus_trip_id = r.bus_trip_id
WHERE
    TRUNC(bt.departure) = TO_DATE('24-01-25', 'yyyy-mm-dd')
GROUP BY
    bt.bus_trip_id, bt.departure_location, bt.bt_destination, bt.departure, b.seating_capacity;

    
--Free seats for a specific time
SELECT
    bt.bus_trip_id,
    bt.departure_location,
    bt.bt_destination,
    bt.departure,
    b.seating_capacity - COUNT(r.ticket_id) AS free_seats
FROM
    bus_trip bt
JOIN bus b ON bt.bus_id = b.bus_id
LEFT JOIN reservation r ON bt.bus_trip_id = r.bus_trip_id
WHERE
    TO_CHAR(bt.departure, 'hh24:mi:ss') = '12:30:00'
GROUP BY
    bt.bus_trip_id, bt.departure_location, bt.bt_destination, bt.departure, b.seating_capacity;


--Sales for a said period
SELECT
    r.reservation_date,
    t.ticket_destination,
    t.price
FROM
    reservation r
JOIN ticket t ON r.ticket_id = t.ticket_id
WHERE
    r.reservation_date BETWEEN TO_DATE('24-01-07', 'yyyy-mm-dd') AND TO_DATE('24-02-05', 'yyyy-mm-dd')
GROUP BY
    r.reservation_date, t.ticket_destination, t.price
ORDER BY
    r.reservation_date;
    

--BONUS number of reservations for each trip
SELECT
    bt.bus_trip_id,
    bt.departure_location,
    bt.bt_destination,
    bt.departure,
    (SELECT COUNT(*) FROM reservation r WHERE r.bus_trip_id = bt.bus_trip_id) AS total_reservations
FROM
    bus_trip bt;
