# Small Condominium Apartment Database Design 

## Requirements
A small Condominium Apartment wants to keep track of rooms that are 
available and rented so they could manage it faster and easier, they
also wanted to keep record of rent history for analysis. 

## Identities and attributes
Amenities = [Amenity ID, amenity]
Room = [Room Id, room number, floor, price, status]
Renter = [Renter Id, first name, middle name, last name, suffix, contact]
Rent = [Rent Id, rent date, rent end]
Rating_Info = [rating value, description, rating_date]

## Defining Relationships
1.) A Renter can rent multiple Rooms over time.
2.) A Room can be rented by multiple Renters over time.
3.) Rent_Details breaks the many-to-many relationship between Renter and Room.
4.) A Room can have multiple Amenities.
5.) An Amenity can be applied to multiple Rooms.
6.) Room_Amenities breaks the many-to-many relationship between Room and Amenity.
7.) A Renter can rate a Room.
8.) A Room can be rated by multiple Renters.
9.) Rating_info breaks the many-to-many relationship between Renter and Room (for ratings).

## Features 
1.) Stored Procedure with a transaction inside

## How to run 
1.) Import either implementation.sql or schema.dbml in your corresponding database application program
2.) Import the seeding.sql to populate the Database
3.) Try the sample queries provided
