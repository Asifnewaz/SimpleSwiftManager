# SQL

```
- - - - - - - - - - - - - - - - - - - 
CRUD      SQL       HTTP
- - - - - - - - - - - - - - - - - - - 
Create    INSERT	  POST
Read	  SELECT	  GET
Update	  UPDATE	  PUT
Delete	  DELETE	  DELETE
```

## Crate/Drop DB

```sql
CREATE DATABASE databasename;
DROP DATABASE databasename;
```

## Create Table                     

```
Structure:                              Example:
```
```sql
CREATE TABLE table_name (               CREATE TABLE Persons (                   
    column1 datatype,                       PersonID int,
    column2 datatype,                       LastName varchar(255),
    column3 datatype,                       FirstName varchar(255),
   ....                                     Address varchar(255),
);                                      );
```

## DROP/TRUNCATE Table                     
```
Structure:                              Example:
```
```sql
DROP TABLE table_name;                  DROP TABLE Shippers;
```

```sql
TRUNCATE TABLE table_name;              TRUNCATE TABLE Shippers;
```

** Difference between drop and Truncate is: 
    - Drop is used to drop an existing table in a database.
    - Truncate is used to delete the data inside a table, but not the table itself.






