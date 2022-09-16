## SQL

- - - - - - - - - - - - - - - - - - - 
CRUD      SQL       HTTP
- - - - - - - - - - - - - - - - - - - 
Create    INSERT	  POST
Read	    SELECT	  GET
Update	  UPDATE	  PUT
Delete	  DELETE	  DELETE

# Crate/Drop DB

```sql
CREATE DATABASE databasename;
DROP DATABASE databasename;
```

# Create Table

Structure:
```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
```

Example:
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);


