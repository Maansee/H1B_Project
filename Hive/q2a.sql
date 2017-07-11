select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='2011' group by worksite,year,case_status order by count_job  desc limit 1;

select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='2012' group by worksite,year,case_status order by count_job  desc limit 1;

select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='2013' group by worksite,year,case_status order by count_job  desc limit 1;

select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='2014' group by worksite,year,case_status order by count_job  desc limit 1;

select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='2015' group by worksite,year,case_status order by count_job  desc limit 1;

select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='2016' group by worksite,year,case_status order by count_job  desc limit 1;


