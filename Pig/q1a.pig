h1b = load '/user/hive/warehouse/h1b_final' using PigStorage('\t') as (s_no:int, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_time_position:chararray, prevailing_wage:int, year:chararray, worksite:chararray, longitude:double, latitude:double);

a1 = filter h1b by $7=='2011';

b1 = group a1 by $4; 

c1 = foreach b1 generate group,COUNT($1); 


a2 = filter h1b by $7=='2012';

b2 = group a2 by $4; 

c2 = foreach b2 generate group,COUNT($1); 


a3 = filter h1b by $7=='2013';

b3 = group a3 by $4; 

c3 = foreach b3 generate group,COUNT($1); 


a4 = filter h1b by $7=='2014';

b4 = group a4 by $4; 

c4 = foreach b4 generate group,COUNT($1); 


a5 = filter h1b by $7=='2015';

b5 = group a5 by $4; 

c5 = foreach b5 generate group,COUNT($1);
 

a6 = filter h1b by $7=='2016';

b6 = group a6 by $4; 

c6 = foreach b6 generate group,COUNT($1);
 


combine = join c1 by $0, c2 by $0, c3 by $0, c4 by $0, c5 by $0, c6 by $0;

job_year_count = foreach combine generate $0,$1,$3,$5,$7,$9,$11;

--dump job_year_count;

job_de = filter job_year_count by $0 matches 'DATA ENGINEER'; 

growth_percent = foreach job_de generate $0, (float)(($6-$5)*100)/$5,(float)(($5-$4)*100)/$4, (float)(($4-$3)*100)/$3, (float)(($3-$2)*100)/$2, (float)(($2-$1)*100)/$1;

dump growth_percent;





