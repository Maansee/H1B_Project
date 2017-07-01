select year, employer_name, count(employer_name) as total from h1b_final where year='2011' group by employer_name,year order by total desc limit 5;

select year, employer_name, count(employer_name) as total from h1b_final where year='2012' group by employer_name,year order by total desc limit 5;

select year, employer_name, count(employer_name) as total from h1b_final where year='2013' group by employer_name,year order by total desc limit 5;

select year, employer_name, count(employer_name) as total from h1b_final where year='2014' group by employer_name,year order by total desc limit 5;

select year, employer_name, count(employer_name) as total from h1b_final where year='2015' group by employer_name,year order by total desc limit 5;

select year, employer_name, count(employer_name) as total from h1b_final where year='2016' group by employer_name,year order by total desc limit 5;

