create table flight(
  -> flight_id int PRIMARY KEY,
  -> deptdate date,
  -> dept_from varchar(255),
  -> dept_to varchar(255),
  -> f_price int,
  -> no_seats int,
  -> airline_id int NOT NULL AUTOINCREMENT,
  -> dept_time time);

insert into flight values(100,'2022-09-11','Bengaluru','Belagavi',3000,150,NULL,'09:30');
insert into flight values(101,'2022-09-11','Bengaluru','Mumbai',6000,200,NULL,'11:30');
insert into flight values(102,'2022-09-11','Delhi','Bengaluru',15000,220,NULL,'1:30');
insert into flight values(103,'2022-09-12','Bihar','Bengaluru',5000,150,NULL,'10:30');
insert into flight values(104,'2022-09-13','Bengaluru','Chennai',7000,150,NULL,'17:30');
insert into flight values(105,'2022-09-21','Bengaluru','Belagavi',10000,150,NULL,'19:30');

 select* from flight;
+-----------+------------+-----------+-----------+---------+----------+------------+-----------+
| flight_id | deptdate   | dept_from | dept_to   | f_price | no_seats | airline_id | dept_time |
+-----------+------------+-----------+-----------+---------+----------+------------+-----------+
|       100 | 2022-09-11 | Bengaluru | Belagavi  |    3000 |      150 |          1 | NULL      |
|       101 | 2022-09-11 | Bengaluru | Mumbai    |    6000 |      200 |          2 | 11:30:00  |
|       102 | 2022-09-11 | Delhi     | Bengaluru |   15000 |      220 |          3 | 01:30:00  |
|       103 | 2022-09-12 | Bihar     | Bengaluru |    5000 |      150 |          4 | 10:30:00  |
|       104 | 2022-09-13 | Bengaluru | Chennai   |    7000 |      150 |          5 | 17:30:00  |
|       105 | 2022-09-21 | Bengaluru | Belagavi  |   10000 |      150 |       NULL | 19:30:00  |
+-----------+------------+-----------+-----------+---------+----------+------------+-----------+
 
CREATE TABLE traveller(
    -> trav_id int primary key auto_increment,
    -> trav_name varchar(255),
    -> trav_add varchar(255),
    -> trav_phone int,
    -> trav_email varchar(255));

insert into traveller values(NULL,'Nandini','Bihar',947,'nandini@gmail');
insert into traveller values(NULL,'poornima','Belagavi',947,'poo@gmail');
insert into traveller values(NULL,'pooja','Bengaluru',947,'pooja@gmail');
insert into traveller values(NULL,'revathi','Bengaluru',989,'reva@gmail');
insert into traveller values(NULL,'thoshi','Bengaluru',237,'thoshi@gmail');

 select* from traveller;
+---------+-----------+-----------+------------+---------------+
| trav_id | trav_name | trav_add  | trav_phone | trav_email    |
+---------+-----------+-----------+------------+---------------+
|       1 | Nandini   | Bihar     |        947 | nandini@gmail |
|       2 | poornima  | Belagavi  |        947 | poo@gmail     |
|       3 | pooja     | Bengaluru |        947 | pooja@gmail   |
|       4 | revathi   | Bengaluru |        989 | reva@gmail    |
|       5 | thoshi    | Bengaluru |        237 | thoshi@gmail  |
+---------+-----------+-----------+------------+---------------+

create table booked(
    -> flight_id int,foreign key(flight_id)references flight(flight_id),
    -> trav_id int,foreign key(trav_id)references traveller(trav_id),
    -> book_status varchar(255));

insert into booked values(100,3,'yes');
insert into booked values(101,4,'yes');
insert into booked values(102,null,'no');
insert into booked values(103,1,'yes');
insert into booked values(104,5,'yes');

select* from booked;
+-----------+---------+-------------+
| flight_id | trav_id | book_status |
+-----------+---------+-------------+
|       100 |       3 | yes         |
|       101 |       4 | yes         |
|       102 |    NULL | no          |
|       103 |       1 | yes         |
|       104 |       5 | yes         |
+-----------+---------+-------------+

/*check how many flights are scheduled this week*/

select flight_id,dept_from,dept_to from flight where deptdate BETWEEN '2022-09-10' and '2022-09-17';
+-----------+-----------+-----------+
| flight_id | dept_from | dept_to   |
+-----------+-----------+-----------+
|       100 | Bengaluru | Belagavi  |
|       101 | Bengaluru | Mumbai    |
|       102 | Delhi     | Bengaluru |
|       103 | Bihar     | Bengaluru |
|       104 | Bengaluru | Chennai   |
+-----------+-----------+-----------+

 alter table traveller add flight_id int;
 desc traveller;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| trav_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| trav_name  | varchar(255) | YES  |     | NULL    |                |
| trav_add   | varchar(255) | YES  |     | NULL    |                |
| trav_phone | int(11)      | YES  |     | NULL    |                |
| trav_email | varchar(255) | YES  |     | NULL    |                |
| flight_id  | int(11)      | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

 UPDATE traveller
    -> SET flight_id=100 where trav_id =1;
 UPDATE traveller
    -> SET flight_id = 101 where trav_id = 2;
 UPDATE traveller
    -> SET flight_id=102 where trav_id =3;
 UPDATE traveller
    -> SET flight_id = 103 where trav_id = 4;
 UPDATE traveller
    -> SET flight_id=104 where trav_id =5;
select*from traveller;
+---------+-----------+-----------+------------+---------------+-----------+
| trav_id | trav_name | trav_add  | trav_phone | trav_email    | flight_id |
+---------+-----------+-----------+------------+---------------+-----------+
|       1 | Nandini   | Bihar     |        947 | nandini@gmail |       100 |
|       2 | poornima  | Belagavi  |        947 | poo@gmail     |       101 |
|       3 | pooja     | Bengaluru |        947 | pooja@gmail   |       102 |
|       4 | revathi   | Bengaluru |        989 | reva@gmail    |       103 |
|       5 | thoshi    | Bengaluru |        237 | thoshi@gmail  |       104 |
+---------+-----------+-----------+------------+---------------+-----------+

/* flight id corresponding the traveller*/

 select f.flight_id,f.airline_id,t.trav_id,t.trav_name from traveller t,flight f where f.flight_id=t.flight_id and f.flight_id=101;
+-----------+------------+---------+-----------+
| flight_id | airline_id | trav_id | trav_name |
+-----------+------------+---------+-----------+
|       101 |          2 |       2 | poornima  |
+-----------+------------+---------+-----------+

/*how much money received from per flight*/

select SUM(s.f_price),s.flight_id from flight s GROUP BY s.flight_id;
+----------------+-----------+
| SUM(s.f_price) | flight_id |
+----------------+-----------+
|           3000 |       100 |
|           6000 |       101 |
|          15000 |       102 |
|           5000 |       103 |
|           7000 |       104 |
|          10000 |       105 |
+----------------+-----------+







