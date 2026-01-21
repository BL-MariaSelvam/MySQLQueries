mysql> create database AddressBookSyatem;
Query OK, 1 row affected (0.01 sec)

mysql> use AddressBookSystem;
ERROR 1049 (42000): Unknown database 'addressbooksystem'
mysql> use AddressBookSyatem;
Database changed
mysql> create table Contacts(userId int auto_increment primary key,firstName varchar(25),lastName varchar(25),email varchar(20));
Query OK, 0 rows affected (0.04 sec)

mysql> create table Address(addressId int auto_increment primary key,streetName varchar(25),city varchar(25),state varchar(25),zip char(6));
Query OK, 0 rows affected (0.04 sec)

mysql> create table phone(phoneId int auto_increment,mobileNo char(10),userId int,foreign key(userId) references Contacts(userId));
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> create table phone(phoneId int auto_increment primary key,mobileNo char(10),userId int,foreign key(userId) references Contacts(userId));
Query OK, 0 rows affected (0.05 sec)

mysql> create table AddressBook(addressBookId int auto_increment primary key,addressBookName varchar(20),addressBookType varchar(20));
Query OK, 0 rows affected (0.04 sec)

mysql> create table AddressBook_contacts(addressContactId int auto_increment primary key,userId int,foreign key(userId) references Contacts(userId),addressBookId int,foreign key(addressBookId) references AddressBook(addressBookId));
Query OK, 0 rows affected (0.06 sec)

mysql> desc Contacts;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| userId    | int         | NO   | PRI | NULL    | auto_increment |
| firstName | varchar(25) | YES  |     | NULL    |                |
| lastName  | varchar(25) | YES  |     | NULL    |                |
| email     | varchar(20) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> desc Address;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| addressId  | int         | NO   | PRI | NULL    | auto_increment |
| streetName | varchar(25) | YES  |     | NULL    |                |
| city       | varchar(25) | YES  |     | NULL    |                |
| state      | varchar(25) | YES  |     | NULL    |                |
| zip        | char(6)     | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> desc phone;
+----------+----------+------+-----+---------+----------------+
| Field    | Type     | Null | Key | Default | Extra          |
+----------+----------+------+-----+---------+----------------+
| phoneId  | int      | NO   | PRI | NULL    | auto_increment |
| mobileNo | char(10) | YES  |     | NULL    |                |
| userId   | int      | YES  | MUL | NULL    |                |
+----------+----------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> desc AddressBook;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| addressBookId   | int         | NO   | PRI | NULL    | auto_increment |
| addressBookName | varchar(20) | YES  |     | NULL    |                |
| addressBookType | varchar(20) | YES  |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> desc Address_contacts
    -> ;
ERROR 1146 (42S02): Table 'addressbooksyatem.address_contacts' doesn't exist
mysql> desc AddressBook_contacts;
+------------------+------+------+-----+---------+----------------+
| Field            | Type | Null | Key | Default | Extra          |
+------------------+------+------+-----+---------+----------------+
| addressContactId | int  | NO   | PRI | NULL    | auto_increment |
| userId           | int  | YES  | MUL | NULL    |                |
| addressBookId    | int  | YES  | MUL | NULL    |                |
+------------------+------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> alter table Address add constraint userId foreign key (userId) references Contacts(userId);
ERROR 1072 (42000): Key column 'userId' doesn't exist in table
mysql> alter table Address add column userId int;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table Address add constraint userId foreign key (userId) references Contacts(userId);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Address;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| addressId  | int         | NO   | PRI | NULL    | auto_increment |
| streetName | varchar(25) | YES  |     | NULL    |                |
| city       | varchar(25) | YES  |     | NULL    |                |
| state      | varchar(25) | YES  |     | NULL    |                |
| zip        | char(6)     | YES  |     | NULL    |                |
| userId     | int         | YES  | MUL | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> notee
