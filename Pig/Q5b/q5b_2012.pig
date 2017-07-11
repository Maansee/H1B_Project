h1b = load '/user/hive/warehouse/h1b_final' using PigStorage('\t') as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, worksite:chararray, longitude:double, latitude:double);


h1b_a= filter h1b by case_status=='CERTIFIED';

h1b_b = group h1b_a by (job_title,year);

h1b_c = foreach h1b_b generate FLATTEN(group) as (job_title, year),COUNT(h1b_a.case_status) as total;

h1b_d = filter h1b_c by year=='2012';

h1b_e = order h1b_d by total desc;

h1b_f = LIMIT h1b_e 10;

dump h1b_f;




