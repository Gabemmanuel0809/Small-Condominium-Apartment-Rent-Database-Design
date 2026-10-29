INSERT INTO amenities (id, amenity) VALUES
(1, 'Wi-Fi'), (2, 'Air conditioning'), (3, 'Private bathroom'),
(4, 'Balcony'), (5, 'Kitchenette'), (6, 'Laundry access'),
(7, 'Parking'), (8, 'Swimming pool'), (9, 'Gym access'),
(10, 'Desk'), (11, 'Mini fridge'), (12, 'TV'),
(13, 'City view'), (14, 'Pet friendly'), (15, 'Storage');

INSERT INTO rooms (id, room_no, floor, price, status) VALUES
(1, '101', '1st floor', 450.00, 'Rented'), (2, '102', '1st floor', 475.00, 'Rented'),
(3, '103', '1st floor', 500.00, 'Rented'), (4, '201', '2nd floor', 525.00, 'Rented'),
(5, '202', '2nd floor', 550.00, 'Rented'), (6, '203', '2nd floor', 575.00, 'Rented'),
(7, '301', '3rd floor', 600.00, 'Rented'), (8, '302', '3rd floor', 625.00, 'Rented'),
(9, '303', '3rd floor', 650.00, 'Rented'), (10, '401', '4th floor', 675.00, 'Rented'),
(11, '402', '4th floor', 700.00, 'Rented'), (12, '403', '4th floor', 725.00, 'Rented'),
(13, '501', '5th floor', 750.00, 'Rented'), (14, '502', '5th floor', 775.00, 'Rented'),
(15, '503', '5th floor', 800.00, 'Rented'), (16, '601', '6th floor', 650.00, 'Available');

INSERT INTO renter (id, fname, mname, lname, suffix, phone_no) VALUES
(1, 'Ava', 'Marie', 'Reyes', NULL, '555-0101'),
(2, 'Liam', NULL, 'Santos', NULL, '555-0102'),
(3, 'Mia', 'Claire', 'Cruz', NULL, '555-0103'),
(4, 'Noah', NULL, 'Garcia', 'Jr.', '555-0104'),
(5, 'Isla', 'Rose', 'Mendoza', NULL, '555-0105'),
(6, 'Ethan', NULL, 'Flores', NULL, '555-0106'),
(7, 'Sofia', 'Mae', 'Ramos', NULL, '555-0107'),
(8, 'Lucas', NULL, 'Torres', NULL, '555-0108'),
(9, 'Amelia', 'Jane', 'Castro', NULL, '555-0109'),
(10, 'Mateo', NULL, 'Rivera', NULL, '555-0110'),
(11, 'Charlotte', 'Ann', 'Diaz', NULL, '555-0111'),
(12, 'James', NULL, 'Aquino', 'III', '555-0112'),
(13, 'Harper', 'Lee', 'Villanueva', NULL, '555-0113'),
(14, 'Benjamin', NULL, 'Bautista', NULL, '555-0114'),
(15, 'Evelyn', 'Grace', 'Navarro', NULL, '555-0115');

INSERT INTO room_amenities (amenity_id, room_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15);

INSERT INTO rent (id, renter_id, rent_date, rent_end) VALUES
(1, 1, '2026-01-01', '2026-12-31'), (2, 2, '2026-01-02', '2026-12-31'),
(3, 3, '2026-01-03', '2026-12-31'), (4, 4, '2026-01-04', '2026-12-31'),
(5, 5, '2026-01-05', '2026-12-31'), (6, 6, '2026-01-06', '2026-12-31'),
(7, 7, '2026-01-07', '2026-12-31'), (8, 8, '2026-01-08', '2026-12-31'),
(9, 9, '2026-01-09', '2026-12-31'), (10, 10, '2026-01-10', '2026-12-31'),
(11, 11, '2026-01-11', '2026-12-31'), (12, 12, '2026-01-12', '2026-12-31'),
(13, 13, '2026-01-13', '2026-12-31'), (14, 14, '2026-01-14', '2026-12-31'),
(15, 15, '2026-01-15', '2026-12-31');

INSERT INTO rent_details (id, rent_id, room_id, price_at_rent) VALUES
(1, 1, 1, 450.00), (2, 2, 2, 475.00), (3, 3, 3, 500.00),
(4, 4, 4, 525.00), (5, 5, 5, 550.00), (6, 6, 6, 575.00),
(7, 7, 7, 600.00), (8, 8, 8, 625.00), (9, 9, 9, 650.00),
(10, 10, 10, 675.00), (11, 11, 11, 700.00),
(12, 12, 12, 725.00), (13, 13, 13, 750.00),
(14, 14, 14, 775.00), (15, 15, 15, 800.00);

INSERT INTO rating_info (id, renter_id, room_id, rating, descript, rating_date) VALUES
(1, 1, 1, 5, 'Clean and comfortable room.', '2026-02-01'),
(2, 2, 2, 4, 'Good value and location.', '2026-02-02'),
(3, 3, 3, 5, 'Quiet room with helpful staff.', '2026-02-03'),
(4, 4, 4, 4, 'Spacious and well maintained.', '2026-02-04'),
(5, 5, 5, 3, 'Comfortable, with some minor issues.', '2026-02-05'),
(6, 6, 6, 5, 'Everything was in excellent condition.', '2026-02-06'),
(7, 7, 7, 4, 'Convenient and tidy.', '2026-02-07'),
(8, 8, 8, 5, 'Great room and amenities.', '2026-02-08'),
(9, 9, 9, 4, 'A pleasant place to stay.', '2026-02-09'),
(10, 10, 10, 3, 'Decent room for the price.', '2026-02-10'),
(11, 11, 11, 5, 'Bright, clean, and comfortable.', '2026-02-11'),
(12, 12, 12, 4, 'Nice facilities and friendly service.', '2026-02-12'),
(13, 13, 13, 5, 'Excellent view and a quiet floor.', '2026-02-13'),
(14, 14, 14, 4, 'Comfortable stay overall.', '2026-02-14'),
(15, 15, 15, 5, 'Would gladly stay here again.', '2026-02-15');