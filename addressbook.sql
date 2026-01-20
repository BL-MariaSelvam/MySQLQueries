mysql> create database addressBookService;
Query OK, 1 row affected (0.258 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| addressbookservice |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.032 sec)

mysql> use addressBookService
Database changed
mysql> create table addressBook (addressBookId int not null auto_increment primary key,firstName varchar(25),lastName varchar(25),address varchar(20),city varchar(20),state varchar(20),zip char(6),mobile char(10),email varchar(25));
Query OK, 0 rows affected (0.605 sec)

mysql> insert into addressBook(firstName.lastName,address,city,state,zip,mobile,email) values("Maria","Selvam","Tambaram","chennai","Tamilnadu","600073","8898765456","maria@gmail.com"),("Peter","Prasanna","Bangalore","Bangalore","Karnataka","600075","8898765467","peter@gmail.com");
ERROR 1054 (42S22): Unknown column 'firstName.lastName' in 'field list'
mysql> insert into addressBook(firstName,lastName,address,city,state,zip,mobile,email) values("Maria","Selvam","Tambaram","chennai","Tamilnadu","600073","8898765456","maria@gmail.com"),("Peter","Prasanna","Bangalore","Bangalore","Karnataka","600075","8898765467","peter@gmail.com");
Query OK, 2 rows affected (0.359 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address   | city      | state     | zip    | mobile     | email           |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             2 | Peter     | Prasanna | Bangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
2 rows in set (0.010 sec)

mysql> update addressBook set address="Mangalore" where firstName="Peter" and lastName="Prasanna"; 
Query OK, 1 row affected (0.347 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address   | city      | state     | zip    | mobile     | email           |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             2 | Peter     | Prasanna | Mangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
2 rows in set (0.009 sec)

mysql> insert into addressBook(firstName,lastName,address,city,state,zip,mobile,email) values("Maria","Selvam","Tambaram","chennai","Tamilnadu","600073","8898765456","maria@gmail.com"),("Peter","Prasanna","Bangalore","Bangalore","Karnataka","600075","8898765467","peter@gmail.com");
Query OK, 2 rows affected (0.363 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address   | city      | state     | zip    | mobile     | email           |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             2 | Peter     | Prasanna | Mangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com |
|             3 | Maria     | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             4 | Peter     | Prasanna | Bangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
4 rows in set (0.009 sec)

mysql> delete from addressBook where firstName="Peter" and address="Mangalore";
Query OK, 1 row affected (0.359 sec)

mysql> select * from addressBook;
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address   | city      | state     | zip    | mobile     | email           |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             3 | Maria     | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             4 | Peter     | Prasanna | Bangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
3 rows in set (0.010 sec)

mysql> select * from addressBook where city="Bangalore";
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address   | city      | state     | zip    | mobile     | email           |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
|             4 | Peter     | Prasanna | Bangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com |
+---------------+-----------+----------+-----------+-----------+-----------+--------+------------+-----------------+
1 row in set (0.012 sec)

mysql> select * from addressBook where state="TamilNadu";
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address  | city    | state     | zip    | mobile     | email           |
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram | chennai | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             3 | Maria     | Selvam   | Tambaram | chennai | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
2 rows in set (0.010 sec)

mysql> select city,count(*) from addressBook group by city;
+-----------+----------+
| city      | count(*) |
+-----------+----------+
| chennai   |        2 |
| Bangalore |        1 |
+-----------+----------+
2 rows in set (0.013 sec)

mysql> select state,count(*) from addressBook group by state;
+-----------+----------+
| state     | count(*) |
+-----------+----------+
| Tamilnadu |        2 |
| Karnataka |        1 |
+-----------+----------+
2 rows in set (0.011 sec)

mysql> select * from addressBook where city="Chennai" order by lastName asc;
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address  | city    | state     | zip    | mobile     | email           |
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram | chennai | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             3 | Maria     | Selvam   | Tambaram | chennai | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
2 rows in set (0.014 sec)

mysql> insert into addressBook(firstName,lastName,address,city,state,zip,mobile,email) values("Michael Joe","Rezenya","Nellore","AP","Andhra","600072","8898765423","rezenya@gmail.com"),("John","Rinit","Kochi","Kochi","Kerala","600078","8898765434","rinit@gmail.com");
Query OK, 2 rows affected (0.363 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> insert into addressBook(firstName,lastName,address,city,state,zip,mobile,email) values("Joe","Riya","Nellore","AP","Andhra","600070","8898765413","riya@gmail.com"),("Johan","Rinita","Kochi","Kochi","Kerala","600079","8898455434","rinita@gmail.com");
Query OK, 2 rows affected (0.069 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from addressBook where city="Chennai" order by lastName asc;
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
| addressBookId | firstName | lastName | address  | city    | state     | zip    | mobile     | email           |
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
|             1 | Maria     | Selvam   | Tambaram | chennai | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
|             3 | Maria     | Selvam   | Tambaram | chennai | Tamilnadu | 600073 | 8898765456 | maria@gmail.com |
+---------------+-----------+----------+----------+---------+-----------+--------+------------+-----------------+
2 rows in set (0.013 sec)

mysql> select * from addressBook where city="AP" order by lastName asc;
+---------------+-------------+----------+---------+------+--------+--------+------------+-------------------+
| addressBookId | firstName   | lastName | address | city | state  | zip    | mobile     | email             |
+---------------+-------------+----------+---------+------+--------+--------+------------+-------------------+
|             5 | Michael Joe | Rezenya  | Nellore | AP   | Andhra | 600072 | 8898765423 | rezenya@gmail.com |
|             7 | Joe         | Riya     | Nellore | AP   | Andhra | 600070 | 8898765413 | riya@gmail.com    |
+---------------+-------------+----------+---------+------+--------+--------+------------+-------------------+
2 rows in set (0.010 sec)

mysql> select * from addressBook where city="AP" order by lastName desc;
+---------------+-------------+----------+---------+------+--------+--------+------------+-------------------+
| addressBookId | firstName   | lastName | address | city | state  | zip    | mobile     | email             |
+---------------+-------------+----------+---------+------+--------+--------+------------+-------------------+
|             7 | Joe         | Riya     | Nellore | AP   | Andhra | 600070 | 8898765413 | riya@gmail.com    |
|             5 | Michael Joe | Rezenya  | Nellore | AP   | Andhra | 600072 | 8898765423 | rezenya@gmail.com |
+---------------+-------------+----------+---------+------+--------+--------+------------+-------------------+
2 rows in set (0.012 sec)

mysql> alter table addressBook add column addressBookName varchar(20);
Query OK, 0 rows affected (0.121 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table addressBook add column addressBookType varchar(20);
Query OK, 0 rows affected (0.160 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update addressBook set addressBookName="Personal",addressBookType="Friends" where state="TamilNadu"; 
Query OK, 2 rows affected (0.078 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update addressBook set addressBookName="Office",addressBookType="Collegue" where state="Andhra"; 
Query OK, 2 rows affected (0.069 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> update addressBook set addressBookName="Personal",addressBookType="Family" where state="Karnataka"; 
Query OK, 1 row affected (0.061 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update addressBook set addressBookName="Personal",addressBookType="Family" where state="Kerala"; 
Query OK, 2 rows affected (0.066 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from addressBook;
+---------------+-------------+----------+-----------+-----------+-----------+--------+------------+-------------------+-----------------+-----------------+
| addressBookId | firstName   | lastName | address   | city      | state     | zip    | mobile     | email             | addressBookName | addressBookType |
+---------------+-------------+----------+-----------+-----------+-----------+--------+------------+-------------------+-----------------+-----------------+
|             1 | Maria       | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com   | Personal        | Friends         |
|             3 | Maria       | Selvam   | Tambaram  | chennai   | Tamilnadu | 600073 | 8898765456 | maria@gmail.com   | Personal        | Friends         |
|             4 | Peter       | Prasanna | Bangalore | Bangalore | Karnataka | 600075 | 8898765467 | peter@gmail.com   | Personal        | Family          |
|             5 | Michael Joe | Rezenya  | Nellore   | AP        | Andhra    | 600072 | 8898765423 | rezenya@gmail.com | Office          | Collegue        |
|             6 | John        | Rinit    | Kochi     | Kochi     | Kerala    | 600078 | 8898765434 | rinit@gmail.com   | Personal        | Family          |
|             7 | Joe         | Riya     | Nellore   | AP        | Andhra    | 600070 | 8898765413 | riya@gmail.com    | Office          | Collegue        |
|             8 | Johan       | Rinita   | Kochi     | Kochi     | Kerala    | 600079 | 8898455434 | rinita@gmail.com  | Personal        | Family          |
+---------------+-------------+----------+-----------+-----------+-----------+--------+------------+-------------------+-----------------+-----------------+
7 rows in set (0.008 sec)

mysql> select addressBookType,count(*) as count from addressBook group by addressBookType;
+-----------------+-------+
| addressBookType | count |
+-----------------+-------+
| Friends         |     2 |
| Family          |     3 |
| Collegue        |     2 |
+-----------------+-------+
3 rows in set (0.008 sec)

mysql> notee
