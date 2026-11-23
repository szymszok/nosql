TASK 1
1. select first_name, last_name, department, salary from employees;
2. select * from employees where department = 'Engineering';
3. select * from employees where is_remote = true and salary > 80000;  
4. select * from employees where hire_date between '2021-01-01' and '2022-12-31'
order by hire_date asc;
5. select * from employees where job_title like '%Manager%';
6. select * from employees
order by salary desc limit 3;
7. select count(first_name) as Ilość_pracowników,
    avg(salary) as Średnia_płac
    from employees;
8. select department, 
count(first_name) as Ilość_pracowników,
avg(salary) as Średnia_płac
from employees
group by department;
9. select department, avg(salary) as Średnia_płac
from employees
group by department having avg(salary) > 80000;

TASK 2
1. create table rooms(
    id SERIAL PRIMARY KEY,
    room_name varchar(50) unique NOT NULL,
    capacity int  not null check (capacity > 0),
    has_projector boolean not null DEFAULT TRUE
)
2. create table users(
    id serial primary key,
    full_name varchar(100) not null,
    email varchar(100) not null unique
)
3. create table bookings(
    id serial primary key,
    room_id int not null REFERENCES rooms(id) on delete CASCADE,
    user_id int not null references users(id) on delete CASCADE,
    booking_date date not null,
    duration_hours int check (duration_hours > 0 and duration_hours < 9)
)

A. 
select u.full_name, 
r.room_name,
b.booking_date,
b.duration_hours
from bookings b
join users u on b.user_id = u.id
join rooms r on b.room_id = r.id

B.
iNSERT INTO users (full_name, email) 
VALUES ('Duplicate User', 'alice.johnson@example.com');
INSERT INTO rooms (room_name, capacity, has_projector) 
VALUES ('Tiny Closet', 0, false);
INSERT INTO bookings (room_id, user_id, booking_date, duration_hours) 
VALUES (1, 1, '2026-09-25', 10);

C.
-- Delete user 'Alice Johnson'
DELETE FROM users WHERE email = 'alice.johnson@example.com';

-- Verify that Alice's bookings were automatically removed from the bookings table
SELECT * FROM bookings;

TASK 3

A.
select c.full_name,
c.country,
o.id as order_id,
o.order_date
from customers c
join orders o on o.customer_id = c.id 
where o.status = 'COMPLETED'

B.
select c.full_name,
sum(oi.quantity * oi.unit_price) as total_spent
from customers c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
where o.status = 'COMPLETED'
group by c.full_name

C.
select c.full_name,
sum(oi.quantity * oi.unit_price) as total_spent
from customers c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
where o.status = 'COMPLETED'
group by c.full_name having sum(oi.quantity * oi.unit_price) > 300

D.
create view v_customer_revenue as
select c.full_name,
c.country,
sum(oi.quantity * oi.unit_price) as total_spent
from customers c
join orders o on c.id = o.customer_id
join order_items oi on o.id = oi.order_id
where o.status = 'COMPLETED'
group by c.full_name, c.country

SELECT * FROM v_customer_revenue WHERE country = 'USA';