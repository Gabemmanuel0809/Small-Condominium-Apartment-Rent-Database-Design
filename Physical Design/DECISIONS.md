# My design decisions

## Amenity to Rooms [Relationship = Many-To-Many] 
An amenity can be applied to many rooms and each room can have many amenities
so in order to achieve this I splitted them into three tables namely Amenities table,
Rooms table, and Room_Amenities. I used both room_id and amenity_id as unique attributes 
on the junction table to prevent a room from having the same amenity twice.

## Renter to Rooms [Relationship = Many-To-Many]
A renter can rent many rooms at once, and a room can be rented again and again only 
after the previous rent has ended. I also used split it into three tables Renter, Rent, 
and Rent_details, Renter table records the attributes of the renter such as name, contacts
etc. Rent tables records the date where the renter starts the rent and when will that rent
ends. Rent_details records the rent_id, the room the renter has chosen for the rent and 
the price_at_rent attribute for price analysis snapshot.

## Renter to Room Ratings [Relationship = Many-To-Many]
A renter can rate only rate a room once but they can rate multiple rooms overtime.
A room can be rated only once by a single renter, but it can be rated multiple times
by multiple raters. This is the only Many-To-Many table that required no split to make. 
The table rating_info handles this event alone, and I also made renter_id,
and room_id unique here to prevent having a duplicate ratings in one room 

## One Final Note
I added stored procedure so the application system that would be using this woudld just
call that procedure then the transaction will do its job to make sure that everything
is updated during the insert and no stale data would exist.