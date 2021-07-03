# Air-BnB-Clone
 ### Technologies:
- Ruby
- Sinatra
- PostgresSQL
- Rspec
- Capybara
  - Selenium

### Setup

clone the repo and run:

`$ bundle install`

In the project root.

### To setup the databases
First create two PostgresSQL Databases, one for production and one for dev/test:

```
CREATE DATABASE makers_bnb;

CREATE DATABASE makers_bnb_test;
```

Then run the migration files in `db/migrations/` into them.


### To start the server:

```
$ rackup
```
or specify a port

```
$ rackup -p <port>
```

Run tests with:

```
rspec
```

### Headline specification:
- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### User Stories:
**R1 - Signup/in**
 ```
R1U1.
As a user
So that I can use the app
I want to be able to sign up

R1U2.
As a user
So that I can access the app
I want to be able to sign in

R1U3.
As a user
So that I know that I have added a space
I would like to see a list of spaces
```
**R2 - Adding and listing spaces + space information**
```
R2U1.
As a user
So that I can keep track of the spaces I've added
I want to be able to list them

R2U3.
As a user
So that I can rent out a room
I want to be able to add a space

R2U4.
As a user
So that I can let customers know about my space
I want to be able to add a name, description and price per night for each space.

R2U5.
As a user
So that I can offer the customer a good choice
I want to be able to offer a range of dates for my space.
```
**R3 - booking**
```
R3U1.
As a user
So that I go on a trip
I would like to be able to request any space available on the app for one night

R3U2.
As a user that has listed a space
So I can control the state of my listed space
I would like to be approve a booking request

R3U3.
As a user that has listed a space
So that I prevent a double booking
I would like to ensure that only one user can book a given space at one time

R3U4.
As a user that has listed a space
So that I can have flexible booking
I would like to still receive request until I have confirmed a booking on a given date
```

### Questions:
- do we have different types of user
- who confirms what - we are working on the assumption that it is the poster of a space that confirms

### Minimum Viable Product
- User can sign up
- User can log in
- User can add a space
- User can see listed spaces

### Entity Relationship Diagram
[ERD](https://github.com/Ajay233/Air-BnB-Clone/blob/master/diagrams/ERD.png)
