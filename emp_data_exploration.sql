select * from emp_details;

-- number of rows
select count(*) as row_num from emp_details;

-- number of columns
select count(*) as col_num from information_schema.columns where table_name='emp_details';

 -- numeric and percenatge breakdown based on gender
select gender,count(*) as count,round(count(*)/(select count(*) from emp_details)*100,1) as perc from emp_details group by gender;

-- How are fifferent employees of org situated with respect to hierarchy:
select posid,count(*) as count from emp_details group by posid;

-- numeric and percentage distribution of men and women in power
select gender,count(posid) as count,round(count(posid)/(select count(*) from emp_details where posid=4)*100,1) as perc from emp_details where posid=4 group by gender ; 

-- employees getting good bonus
select count(*) as count from emp_details where bonus>5000;

-- Numeric distribution as per performance
select perf,count(*) as count from emp_details group by perf;

-- performance summary
select fname,lname,perf from emp_details order by 1; 

-- average salary of employees
select avg(salary) from emp_details;

-- average bonus of employees
select avg(bonus) from emp_details;

-- average salary and bonus of employees
select round(avg(salary),0),round(avg(bonus),0)from emp_details;

update emp_details set hdate=str_to_date(hdate,'%m/%d/%Y');
alter table emp_details modify hdate date;


-- 21st century joinees
select * from emp_details where year(hdate)>1999;

-- yearwise joinees 
select year(hdate),count(*) from emp_details group by year(hdate);

