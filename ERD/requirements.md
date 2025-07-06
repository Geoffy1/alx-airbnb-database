# Entity-Relationship Diagram for Airbnb Database

This ERD illustrates the database design for an Airbnb-like platform.

## Key Entities:
- **User**: Stores information about platform users including guests and hosts.
- **Property**: Properties listed by hosts.
- **Booking**: Records of bookings made by guests for properties.
- **Payment**: Payment details for each booking.
- **Review**: User reviews for properties.
- **Message**: Internal messaging between users.

## Design Notes:
- A user can be both a guest and a host.
- Each booking must link to a valid user and property.
- Each booking can only have one payment.
- Messaging system allows users to communicate via messages.

Diagram: ![ERD](https://drive.google.com/file/d/1VAnakX_TEptryelu27as06eDHd10po27/view?usp=sharing)

