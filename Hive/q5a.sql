select year, job_title, count(job_title) as count_job from h1b_final where year='2011' group by job_title,year order by count_job desc limit 10;

select year, job_title, count(job_title) as count_job from h1b_final where year='2012' group by job_title,year order by count_job desc limit 10;

select year, job_title, count(job_title) as count_job from h1b_final where year='2013' group by job_title,year order by count_job desc limit 10;

select year, job_title, count(job_title) as count_job from h1b_final where year='2014' group by job_title,year order by count_job desc limit 10;

select year, job_title, count(job_title) as count_job from h1b_final where year='2015' group by job_title,year order by count_job desc limit 10;

select year, job_title, count(job_title) as count_job from h1b_final where year='2016' group by job_title,year order by countjob desc limit 10;


