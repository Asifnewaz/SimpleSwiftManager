# Basic SQL

```
- - - - - - - - - - - - - - - - - - - 
CRUD      SQL       HTTP
- - - - - - - - - - - - - - - - - - - 
Create    INSERT	  POST
Read	  SELECT	  GET
Update	  UPDATE	  PUT
Delete	  DELETE	  DELETE
```
## Select

```sql
SELECT * FROM table_name;               SELECT column1, column2,..
                                        FROM table_name;
```

* The SELECT DISTINCT statement is used to return only distinct (different) values.

```sql
SELECT DISTINCT column1, column2,..
FROM table_name;
```

## Where Clause for Filter
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;                        (EX: WHERE CountryID=1;)
```

- INSERT INTO Syntax    ``` INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...); ```
- UPDATE Syntax         ``` UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition; ```
- DELETE Syntax         ``` DELETE FROM table_name WHERE condition; ```
- 

# Joins
* Types: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN

```sql
SELECT column1, column1, column1, ..
FROM table_one
INNER JOIN table_two ON some_conditions (like: Orders.CustomerID=Customers.CustomerID);
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
CREATE TABLE table_name (               CREATE TABLE Persons (                  CREATE TABLE Persons (                   
    column1 datatype,                       PersonID int,                           PersonID int NOT NULL PRIMARY KEY,
    column2 datatype,                       LastName varchar(255),                  LastName varchar(255),
    column3 datatype,                       FirstName varchar(255),                 FirstName varchar(255),
   ....                                     Address varchar(255),                   Address varchar(255),
);                                      );                                      );
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


## SQL ALTER TABLE

```
Structure:                              Example:
```
- ADD Column
```sql
ALTER TABLE table_name                  ALTER TABLE Customers
ADD column_name datatype;               ADD Email varchar(255);
```

- DROP COLUMN
```sql
ALTER TABLE table_name                  ALTER TABLE Customers
DROP COLUMN column_name;                DROP COLUMN Email;
```

- ALTER/MODIFY COLUMN (To change the data type of a column)
```sql
ALTER TABLE table_name                  ALTER TABLE Customers
ALTER COLUMN column_name datatype;      ALTER COLUMN Email varchar(128);;
```



