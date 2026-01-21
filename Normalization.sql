mysql> desc Employee;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| empId     | int         | NO   | PRI | NULL    | auto_increment |
| empName   | varchar(25) | NO   |     | NULL    |                |
| gender    | varchar(10) | YES  |     | NULL    |                |
| startDate | date        | YES  |     | NULL    |                |
| street    | varchar(20) | YES  |     | NULL    |                |
| city      | varchar(20) | YES  |     | NULL    |                |
| state     | varchar(20) | YES  |     | NULL    |                |
| zip       | char(6)     | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> desc Employee_phone;
+----------+----------+------+-----+---------+----------------+
| Field    | Type     | Null | Key | Default | Extra          |
+----------+----------+------+-----+---------+----------------+
| empMobId | int      | NO   | PRI | NULL    | auto_increment |
| mobileNo | char(10) | YES  |     | NULL    |                |
| empId    | int      | YES  | MUL | NULL    |                |
+----------+----------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> desc department;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| deptId   | int         | NO   | PRI | NULL    | auto_increment |
| deptName | varchar(20) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> desc Employee_department;
+-----------+------+------+-----+---------+----------------+
| Field     | Type | Null | Key | Default | Extra          |
+-----------+------+------+-----+---------+----------------+
| EmpDeptId | int  | NO   | PRI | NULL    | auto_increment |
| empId     | int  | YES  | MUL | NULL    |                |
| deptId    | int  | YES  | MUL | NULL    |                |
+-----------+------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> desc payroll;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| payrollId  | int           | NO   | PRI | NULL    | auto_increment |
| basicPay   | decimal(10,2) | YES  |     | NULL    |                |
| deductions | decimal(10,2) | YES  |     | NULL    |                |
| taxablePay | decimal(10,2) | YES  |     | NULL    |                |
| incomeTax  | decimal(10,2) | YES  |     | NULL    |                |
| netPay     | decimal(10,2) | YES  |     | NULL    |                |
| empId      | int           | YES  | MUL | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> select * from Employee;
+-------+---------+--------+------------+--------------+-----------+------------+--------+
| empId | empName | gender | startDate  | street       | city      | state      | zip    |
+-------+---------+--------+------------+--------------+-----------+------------+--------+
|     1 | Maria   | Female | 2023-09-09 | North street | Chennai   | Tamil Nadu | 600073 |
|     2 | Maria   | Female | 2022-03-06 | East street  | Chennai   | Tamil Nadu | 600074 |
|     3 | Peter   | Male   | 2024-04-02 | West street  | Bangalore | Karnataka  | 600075 |
|     4 | Rinit   | Male   | 2022-10-09 | North street | Kochin    | Kerala     | 600078 |
+-------+---------+--------+------------+--------------+-----------+------------+--------+
4 rows in set (0.00 sec)

mysql> insert into Employee_phone(mobileNo,empId) values("9876543210",1),("8976543231",2),("5678432193",3),("9876548794",3),("9876554788",4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Employee_phone;
+----------+------------+-------+
| empMobId | mobileNo   | empId |
+----------+------------+-------+
|        1 | 9876543210 |     1 |
|        2 | 8976543231 |     2 |
|        3 | 5678432193 |     3 |
|        4 | 9876548794 |     3 |
|        5 | 9876554788 |     4 |
+----------+------------+-------+
5 rows in set (0.00 sec)

mysql> insert into department(deptName) values("Sales"),(Marketing"),("IT"),("HR"),("Finance");
    "> ;
    "> ^C
mysql> insert into department(deptName) values("Sales"),("Marketing"),("IT"),("HR"),("Finance");
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from department;
+--------+-----------+
| deptId | deptName  |
+--------+-----------+
|      1 | Sales     |
|      2 | Marketing |
|      3 | IT        |
|      4 | HR        |
|      5 | Finance   |
+--------+-----------+
5 rows in set (0.00 sec)

mysql> insert into Employee_department(empId,deptId) values(1,1),(2,2),(3,3),(4,5);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into payroll(basicPay,deductions,taxablePay,incomeTax,netPay,empId) values(15000.00,2000.00,30000.00,5000.00,35000.00,1),(20000.00,4000.00,20000.00,7000.00,45000.00,2),(25000.00,4000.00,50000.00,10000.00,55000.00,3),(35000.00,3000.00,40000.00,3000.00,30000.00,4);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from payroll;
+-----------+----------+------------+------------+-----------+----------+-------+
| payrollId | basicPay | deductions | taxablePay | incomeTax | netPay   | empId |
+-----------+----------+------------+------------+-----------+----------+-------+
|         1 | 15000.00 |    2000.00 |   30000.00 |   5000.00 | 35000.00 |     1 |
|         2 | 20000.00 |    4000.00 |   20000.00 |   7000.00 | 45000.00 |     2 |
|         3 | 25000.00 |    4000.00 |   50000.00 |  10000.00 | 55000.00 |     3 |
|         4 | 35000.00 |    3000.00 |   40000.00 |   3000.00 | 30000.00 |     4 |
+-----------+----------+------------+------------+-----------+----------+-------+
4 rows in set (0.00 sec)

mysql> select e.gender,sum(p.netPay) from Employee e join payroll p on e.empId=p.empId group by e.gender;
+--------+---------------+
| gender | sum(p.netPay) |
+--------+---------------+
| Female |      80000.00 |
| Male   |      85000.00 |
+--------+---------------+
2 rows in set (0.00 sec)

mysql> select e.gender,avg(p.netPay) from Employee e join payroll p on e.empId=p.empId group by e.gender;
+--------+---------------+
| gender | avg(p.netPay) |
+--------+---------------+
| Female |  40000.000000 |
| Male   |  42500.000000 |
+--------+---------------+
2 rows in set (0.01 sec)

mysql> select e.gender,min(p.netPay) from Employee e join payroll p on e.empId=p.empId group by e.gender;
+--------+---------------+
| gender | min(p.netPay) |
+--------+---------------+
| Female |      35000.00 |
| Male   |      30000.00 |
+--------+---------------+
2 rows in set (0.01 sec)

mysql> select e.gender,max(p.netPay) from Employee e join payroll p on e.empId=p.empId group by e.gender;
+--------+---------------+
| gender | max(p.netPay) |
+--------+---------------+
| Female |      45000.00 |
| Male   |      55000.00 |
+--------+---------------+
2 rows in set (0.00 sec)

mysql> select gender,count(*) as count from Employee;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'employeepayrollsystem.Employee.gender'; this is incompatible with sql_mode=only_full_group_by
mysql> select gender,count(*) as count from Employee group by gender;
+--------+-------+
| gender | count |
+--------+-------+
| Female |     2 |
| Male   |     2 |
+--------+-------+
2 rows in set (0.00 sec)

mysql> notee
