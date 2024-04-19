create database employee;
show databases;
use employee;
show tables;



select * from emp;
SELECT * FROM EMP1;
select `Full Name` from emp;
select avg(`Annual Salary`) from emp;
desc emp;

#count
select count(`Employee ID`) as total_employees from emp;
select Department,count(`Employee ID` ) from emp group by Department;
select count(`Annual Salary`) from emp where `Annual Salary` > '$150,000';

#where
select * from emp where `Gender` = 'Male' and `Age` >30 ;
select * from emp where `Gender` = 'Male' or `Age` >30 ;
select * from emp where Ethnicity in('asian');
select * from emp where Ethnicity not in('asian');
select * from emp where `Full Name` like'G%';
select * from emp where `Full Name` like'%A';
select * from emp where `Full Name` like'%G%';
select * from emp where `Full Name` like'Ga_%';
select * from emp where `Full Name` like'__s%';

#update
set sql_safe_updates = 0;
update emp set `Bonus %` = concat('2+ ',`Bonus %`) where Ethnicity = 'Asian';
delete from emp where `Employee ID`= 'e02272';

#sub query				
select * from emp where `Employee ID` = any(select `Employee ID` from emp1 where `Business Unit`= 'Manufacturing' );


#view
create view show_manager_salary as select `Annual salary`from emp where `Job title` = 'manager';
select * from show_manager_salary;
drop view show_manager_salary;



#Group by
select Country from emp group by Country;
select Department from emp group by Department;
select `Job Title` from emp group by `Job Title`;


#join
select emp.`Employee ID` ,emp.`Full Name`,emp.`Annual Salary`,emp1.Department from emp inner join  emp1 on emp.`Employee ID` = emp1.`Employee ID`;
select emp.`Employee ID` ,emp.`Full Name`,emp.`Annual Salary`,emp1.Department from emp left join  emp1 on emp.`Employee ID` = emp1.`Employee ID`;
select emp.`Employee ID` ,emp.`Full Name`,emp.`Annual Salary`,emp1.Department  from emp right join  emp1 on emp.`Employee ID` = emp1.`Employee ID`;

#delimiter
Delimiter $$
create trigger e_insert
before insert on emp
for each row
begin
if new.age > 60 then
signal sqlstate '45000'
set message_text  = 'It is time for rest not for work' ;
end if;
end;
$$
Delimiter ;

