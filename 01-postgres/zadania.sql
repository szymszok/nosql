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
1. create table(
    id SERIAL INCREMENT PRIMARY KEY,
    room_name unique NOTNULL varchar(50),
    capacity int check capacity > 0 ?????
    has_projector bool DEFAULT = TRUE
)
create table(
    id serial increment primary key,
)