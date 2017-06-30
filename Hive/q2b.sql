select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='2011' group by worksite,year order by count_cases desc limit 5; 

select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='2012' group by worksite,year order by count_cases desc limit 5; 

select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='2013' group by worksite,year order by count_cases desc limit 5; 

select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='2014' group by worksite,year order by count_cases desc limit 5; 

select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='2015' group by worksite,year order by count_cases desc limit 5; 

select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='2016' group by worksite,year order by count_cases desc limit 5; 
