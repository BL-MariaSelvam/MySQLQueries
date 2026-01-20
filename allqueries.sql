mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.016 sec)

mysql> drop database payroll_service;
Query OK, 1 row affected (0.255 sec)

mysql> create database payroll_service;
Query OK, 1 row affected (0.392 sec)

mysql> use payroll_service;
Database changed
mysql> create table employee_payroll(empId int auto_increment primary key,empName varchar(25),salary decimal(10,2),startDate Date);
Query OK, 0 rows affected (0.507 sec)

mysql> insert into employee_payroll values("Maria",35000.00,"03-03-2024"),("Selvam",40000.00,"06-11-2023");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into employee_payroll(empName,salary,startDate) values("Maria",35000.00,"03-03-2024"),("Selvam",40000.00,"06-11-2023");
ERROR 1292 (22007): Incorrect date value: '03-03-2024' for column 'startDate' at row 1
mysql> insert into employee_payroll(empName,salary,startDate) values("Maria",35000.00,"2024-06-01"),("Selvam",40000.00,"2023-03-03");
Query OK, 2 rows affected (0.361 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+----------+------------+
| empId | empName | salary   | startDate  |
+-------+---------+----------+------------+
|     1 | Maria   | 35000.00 | 2024-06-01 |
|     2 | Selvam  | 40000.00 | 2023-03-03 |
+-------+---------+----------+------------+
2 rows in set (0.009 sec)

mysql> select * from employee_payroll where empName="Maria";
+-------+---------+----------+------------+
| empId | empName | salary   | startDate  |
+-------+---------+----------+------------+
|     1 | Maria   | 35000.00 | 2024-06-01 |
+-------+---------+----------+------------+
1 row in set (0.010 sec)

mysql> select * from employee_payroll where startDate between cast("2018-01-01" as Date) and Date(Now());
+-------+---------+----------+------------+
| empId | empName | salary   | startDate  |
+-------+---------+----------+------------+
|     1 | Maria   | 35000.00 | 2024-06-01 |
|     2 | Selvam  | 40000.00 | 2023-03-03 |
+-------+---------+----------+------------+
2 rows in set (0.010 sec)

mysql> select * from employee_payroll where startDate between cast("2014-01-01" as Date) and Date(Now());
+-------+---------+----------+------------+
| empId | empName | salary   | startDate  |
+-------+---------+----------+------------+
|     1 | Maria   | 35000.00 | 2024-06-01 |
|     2 | Selvam  | 40000.00 | 2023-03-03 |
+-------+---------+----------+------------+
2 rows in set (0.012 sec)

mysql> select * from employee_payroll where startDate between cast("2024-01-01" as Date) and Date(Now());
+-------+---------+----------+------------+
| empId | empName | salary   | startDate  |
+-------+---------+----------+------------+
|     1 | Maria   | 35000.00 | 2024-06-01 |
+-------+---------+----------+------------+
1 row in set (0.009 sec)

mysql> alter table employee_payroll add column gender varchar(20);
Query OK, 0 rows affected (0.505 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employee_payroll set gender="Female" where empName="Maria";
Query OK, 1 row affected (0.360 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set gender="Male" where empName="Selvam";
Query OK, 1 row affected (0.075 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+----------+------------+--------+
| empId | empName | salary   | startDate  | gender |
+-------+---------+----------+------------+--------+
|     1 | Maria   | 35000.00 | 2024-06-01 | Female |
|     2 | Selvam  | 40000.00 | 2023-03-03 | Male   |
+-------+---------+----------+------------+--------+
2 rows in set (0.008 sec)

mysql> select sum(salary) as SumOfSalary from employee_payroll;
+-------------+
| SumOfSalary |
+-------------+
|    75000.00 |
+-------------+
1 row in set (0.008 sec)

mysql> select max(salary) as maxOfSalary from employee_payroll;
+-------------+
| maxOfSalary |
+-------------+
|    40000.00 |
+-------------+
1 row in set (0.008 sec)

mysql> select avg(salary) as AverageOfSalary from employee_payroll;
+-----------------+
| AverageOfSalary |
+-----------------+
|    37500.000000 |
+-----------------+
1 row in set (0.008 sec)

mysql> select min(salary) as MinimumOfSalary from employee_payroll;
+-----------------+
| MinimumOfSalary |
+-----------------+
|        35000.00 |
+-----------------+
1 row in set (0.008 sec)

mysql> insert into employee_payroll(empName,salary,startDate,gender) values("Rezenya",38000.00,"2023-04-05","Female"),("Selvi",42000.00,"2025-02-03","Female"),("Rinit",23000.00,"2022-09-09","Male");
Query OK, 3 rows affected (0.508 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+----------+------------+--------+
| empId | empName | salary   | startDate  | gender |
+-------+---------+----------+------------+--------+
|     1 | Maria   | 35000.00 | 2024-06-01 | Female |
|     2 | Selvam  | 40000.00 | 2023-03-03 | Male   |
|     3 | Rezenya | 38000.00 | 2023-04-05 | Female |
|     4 | Selvi   | 42000.00 | 2025-02-03 | Female |
|     5 | Rinit   | 23000.00 | 2022-09-09 | Male   |
+-------+---------+----------+------------+--------+
5 rows in set (0.008 sec)

mysql> select sum(salary) as SumOfSalary from employee_payroll groupby gender;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'gender' at line 1
mysql> select sum(salary) as SumOfSalary from employee_payroll where gender="Male" groupby gender;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'groupby gender' at line 1
mysql> select sum(salary) as SumOfSalary from employee_payroll where gender="Male" group by gender;
+-------------+
| SumOfSalary |
+-------------+
|    63000.00 |
+-------------+
1 row in set (0.009 sec)

mysql> select max(salary) as maxOfSalary from employee_payroll where gender="Male" group by gender;
+-------------+
| maxOfSalary |
+-------------+
|    40000.00 |
+-------------+
1 row in set (0.009 sec)

mysql> select min(salary) as minOfSalary from employee_payroll where gender="Male" group by gender;
+-------------+
| minOfSalary |
+-------------+
|    23000.00 |
+-------------+
1 row in set (0.009 sec)

mysql> select count(*) as CountofMale from employee_payroll where gender="Male" group by gender;
+-------------+
| CountofMale |
+-------------+
|           2 |
+-------------+
1 row in set (0.008 sec)

mysql> select count(*) as CountofMale from employee_payroll group by gender;
+-------------+
| CountofMale |
+-------------+
|           3 |
|           2 |
+-------------+
2 rows in set (0.010 sec)

mysql> select gender,count(*) as CountofMale from employee_payroll group by gender;
+--------+-------------+
| gender | CountofMale |
+--------+-------------+
| Female |           3 |
| Male   |           2 |
+--------+-------------+
2 rows in set (0.009 sec)

mysql> insert into employee_payroll(empName,salary,startDate,gender) values("Rezenya",38000.00,"2023-04-05","Female"),("Selvi",42000.00,"2025-02-03","Female"),("Rinit",23000.00,"2022-09-09","Male");
Query OK, 3 rows affected (0.364 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+----------+------------+--------+
| empId | empName | salary   | startDate  | gender |
+-------+---------+----------+------------+--------+
|     1 | Maria   | 35000.00 | 2024-06-01 | Female |
|     2 | Selvam  | 40000.00 | 2023-03-03 | Male   |
|     3 | Rezenya | 38000.00 | 2023-04-05 | Female |
|     4 | Selvi   | 42000.00 | 2025-02-03 | Female |
|     5 | Rinit   | 23000.00 | 2022-09-09 | Male   |
|     6 | Rezenya | 38000.00 | 2023-04-05 | Female |
|     7 | Selvi   | 42000.00 | 2025-02-03 | Female |
|     8 | Rinit   | 23000.00 | 2022-09-09 | Male   |
+-------+---------+----------+------------+--------+
8 rows in set (0.008 sec)

mysql> select distinct(empName) from employee_payroll;
+---------+
| empName |
+---------+
| Maria   |
| Selvam  |
| Rezenya |
| Selvi   |
| Rinit   |
+---------+
5 rows in set (0.010 sec)

mysql> notee;
