## Bookmark Manager
Pairing with Sophie B
<br>
First user story:

```
As a user
So that I can view a list of useful websites
I want to be shown a list of bookmarks

As a user
So that I save a useful website
I want to be able to add an entry to my list of bookmarks
```
<br><br>

Domain model for first user story:
<p align="center">
<img src=/images/Updated_1stDomain_Model.png width=60%>
</p>

### SQL instructions used to create bookmark_manager database

1. Connect to psql
2. Create a database: CREATE DATABASE "bookmark_manager";
3. Connect to the database: \c bookmark_manager;
4. Create table: run query we have saved in file 01_create_bookmarks_table.sql

### SQL instructions used to create test database
1. Connect to psql
2. Create test database: CREATE DATABASE "bookmark_manager_test";
3. Create test table: CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

### Initial table:

 id |                url                
----+-----------------------------------
  1 | http://www.makersacademy.com
  3 | http://www.google.com
  2 | http://www.destroyallsoftware.com
  