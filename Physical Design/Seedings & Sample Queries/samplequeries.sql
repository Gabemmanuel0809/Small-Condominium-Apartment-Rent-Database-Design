-- Show all available rooms
SELECT * FROM rooms WHERE status = 'Available';

-- Show all rented rooms 
SELECT * FROM rooms WHERE status = 'Rented';

-- show all rooms from a particular floor
SELECT * FROM rooms WHERE floor = '2nd floor';

-- shows the renter name, the rented room,
-- the date of rent, and the price at rent
SELECT 
  r.lname as Renter,
  rm.room_no AS Room,
  rt.rent_date AS `Rent Date`,
  rd.price_at_rent AS `Rent Price`
FROM rent_details AS rd
JOIN rent AS rt ON rt.id = rd.rent_id
JOIN renter AS r ON r.id = rt.renter_id
JOIN rooms AS rm ON rm.id = rd.room_id
ORDER BY rt.id;

-- shows the total earning base on the date provided
SELECT
    SUM(rd.price_at_rent) AS `Total Income`,
    rt.rent_date AS `Rent Date`
FROM rent_details AS rd
JOIN rent AS rt ON rt.id = rd.rent_id
WHERE rt.rent_date = '2026-01-01'
GROUP BY rt.rent_date;

-- Shows the room that has been rented more than the average rent count
WITH RentTotal AS (
  SELECT
    rooms.id AS Room,
    COUNT(rd.rent_id) AS Rentals
  FROM rooms
  JOIN rent_details AS rd ON rd.room_id = rooms.id
  GROUP BY rooms.id
)
SELECT Room, Rentals
FROM RentTotal
WHERE Rentals > (SELECT AVG(Rentals) FROM RentTotal)
ORDER BY Room;

-- show ratings on rooms and its rater
SELECT 
   rm.room_no AS Room,
   ri.rating AS Rating,
   r.lname AS Rater 
FROM rating_info AS ri 
JOIN rooms AS rm ON rm.id = ri.room_id
JOIN renter AS r ON r.id = ri.renter_id
ORDER BY ri.room_id;

-- shows room with higher average rating than the other rooms average rating 
WITH RoomRatings AS(
    SELECT 
       room_id AS Room,
       r.room_no AS Room_No,
       AVG(rating) AS Average_Rating 
    FROM rating_info AS ri
    JOIN rooms AS r ON r.id = ri.room_id
    GROUP BY room_id
)
SELECT 
   Room_no,
   Average_Rating
FROM RoomRatings 
WHERE Average_Rating > (
  SELECT AVG(Average_Rating) FROM RoomRatings
)
ORDER BY Room; 
