select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2011' group by year,job_title order by avg_wage desc;

insert overwrite local directory '/home/user/q8_2011' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2011' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8_2012' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2012' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8_2013' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2013' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8_2014' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2014' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8_2015' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2015' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8_2016' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='Y' and year = '2016' group by year,job_title order by avg_wage desc; 




insert overwrite local directory '/home/user/q8p_2011' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='N' and year = '2011' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8p_2012' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='N' and year = '2012' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8p_2013' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='N' and year = '2013' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8p_2014' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='N' and year = '2014' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8p_2015' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='N' and year = '2015' group by year,job_title order by avg_wage desc; 

insert overwrite local directory '/home/user/q8p_2016' select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='N' and year = '2016' group by year,job_title order by avg_wage desc; 


