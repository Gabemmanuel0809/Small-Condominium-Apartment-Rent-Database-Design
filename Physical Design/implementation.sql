CREATE TABLE amenities(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   amenity VARCHAR(45) NOT NULL
);

CREATE TABLE rooms(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   room_no VARCHAR(10) NOT NULL,
   floor VARCHAR(10) NOT NULL,
   price DECIMAL(6, 2) NOT NULL,
   status ENUM('Available', 'Rented') DEFAULT 'Available'
);

CREATE TABLE room_amenities(
  amenity_id INT UNSIGNED NOT NULL,
  room_id INT UNSIGNED NOT NULL, 
  UNIQUE(amenity_id, room_id),
  FOREIGN KEY (amenity_id) REFERENCES amenities(id) ON DELETE RESTRICT,
  FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE RESTRICT
);

CREATE TABLE renter(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   fname VARCHAR(20) NOT NULL,
   mname VARCHAR(20) NULL,
   lname VARCHAR(20) NOT NULL,
   suffix VARCHAR(20) NULL,
   phone_no VARCHAR(15) NOT NULL
);

CREATE TABLE rent(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   renter_id INT UNSIGNED NOT NULL,
   rent_date DATE DEFAULT (CURDATE()),
   rent_end DATE NOT NULL,

   FOREIGN KEY (renter_id) REFERENCES renter(id) ON DELETE RESTRICT
);

CREATE TABLE rent_details(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   rent_id INT UNSIGNED NOT NULL,
   room_id INT UNSIGNED NOT NULL,
   price_at_rent DECIMAL(8, 2) NOT NULL,

   FOREIGN KEY (rent_id) REFERENCES rent(id) ON DELETE RESTRICT,
   FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE RESTRICT
);

CREATE TABLE rating_info(
   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   renter_id INT UNSIGNED NOT NULL,
   room_id INT UNSIGNED NOT NULL,
   rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
   descript TEXT NULL,
   rating_date DATE DEFAULT (CURDATE()),

   UNIQUE (renter_id, room_id),
   FOREIGN KEY (renter_id) REFERENCES renter(id) ON DELETE RESTRICT,
   FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE RESTRICT
);

DELIMITER $$
   CREATE PROCEDURE AddRent(
      IN p_fname VARCHAR(50),
      IN p_mname VARCHAR(50),
      IN p_lname VARCHAR(50),
      IN p_suffix VARCHAR(50),
      IN p_phone_number VARCHAR(15),
      IN p_room INT,
      IN p_rent_end DATE,
      IN p_rent_price DECIMAL(8, 2)
   ) 
   BEGIN
      DECLARE v_room_status VARCHAR(20);
      DECLARE v_renter_id INT;
      DECLARE v_rent_id INT;

      START TRANSACTION;

       SELECT status INTO v_room_status FROM rooms WHERE id = p_room;
       IF v_room_status = 'Rented' THEN
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: The selected room is already rented!';
       ELSE
         INSERT INTO renter(fname, mname, lname, suffix, phone_no) 
         VALUES(p_fname, p_mname, p_lname, p_suffix, p_phone_number);
      
         SET v_renter_id = LAST_INSERT_ID();
         INSERT INTO rent(renter_id, rent_end)
         VALUES(v_renter_id, p_rent_end);

         SET v_rent_id = Last_Insert_Id();
         INSERT INTO rent_details(rent_id, room_id, price_at_rent)
         VALUES(v_rent_id, p_room, p_rent_price);

         UPDATE rooms SET status = 'Rented' WHERE id = p_room;
         COMMIT;
       END IF;
   END$$
DELIMITER ;