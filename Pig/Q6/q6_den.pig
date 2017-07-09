h1b = load '/user/hive/warehouse/h1b_final' using PigStorage('\t') as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, worksite:chararray, longitude:double, latitude:double);

a1 = foreach h1b generate $7,$1;

a2 = group a1 by year;

--a3 = foreach a2 generate group as year, COUNT(a1) as Total;
a3 = load '/niit/a3_op' using PigStorage(',') as (year:chararray, a1_count:int);
 
a4 = filter a1 by case_status =='DENIED';

a5 = group a4 by year;

--a6 = foreach a5 generate group as year, COUNT(a4) as Denied;
a6 = load '/niit/a6_op_den' using PigStorage(',') as (year:chararray, a4_count:int);

a7 = join a3 by $0, a6 by $0;


a8 = foreach a7 generate $0, $1, $3, ((float)$3*100/(float)$1) as Percentage;

dump a8;
