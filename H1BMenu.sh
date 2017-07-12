#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
        echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"
    echo -e "${MENU}${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest growth in applications. ${NORMAL}"
    echo -e "${MENU}${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 4) ${MENU} Find top 5 locations in the US who have got certified visa for each year.${NORMAL}"
    echo -e "${MENU}${NUMBER} 5) ${MENU} Which industry has the most number of Data Scientist positions?${NORMAL}"
    echo -e "${MENU}${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?${NORMAL}"
    echo -e "${MENU}${NUMBER} 8) ${MENU} Find the most popular top 10 job positions for certified H1B visa applications for each year?${NORMAL}"
    echo -e "${MENU}${NUMBER} 9) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a line graph depicting the pattern of All the cases over the period of time.${NORMAL}"
    echo -e "${MENU}${NUMBER} 10) ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"
    echo -e "${MENU}${NUMBER} 11) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order${NORMAL}"
    echo -e "${MENU}${NUMBER} 12) ${MENU}Which are the employers who have highest success rate in petitions more than 70% and total petions filed more than 1000?${NORMAL}"
    echo -e "${MENU}${NUMBER} 13) ${MENU}Which are the job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000? ${NORMAL}"
    echo -e "${MENU}${NUMBER} 14) ${MENU}Export result for option no 12 to MySQL database.${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}



clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
                 
		pig /home/user/Documents/H1B_Project/Pig/q1a.pig
        show_menu;
        ;;

	2) clear;
        option_picked "1 b) Find top 5 job titles who are having highest average growth in applications. ";
		pig /home/user/Documents/H1B_Project/Pig/q1b.pig
        show_menu;
        ;;

	3) clear;
        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
	 echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
	    hive -e "select year, worksite, case_status,count(job_title) as count_job,count(case_status) as count_case from h1b_final where job_title like '%DATA ENGINEER%' and case_status='CERTIFIED' and year='$var' group by worksite,year,case_status order by count_job  desc limit 1;" 
        show_menu;	
        ;;

	4) clear;
        option_picked "2 b) Find top 5 locations in the US who have got certified visa for each year.";
        echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
	    hive -e " select year, worksite, count(case_status) as count_cases from h1b_final where case_status='CERTIFIED' and year='$var' group by worksite,year order by count_cases desc limit 5;" 
        show_menu;
        ;;

	5) clear;
        option_picked "3) Which industry has the most number of Data Scientist positions?";
	hadoop fs -rmr /niit/q31
        hadoop jar h1b.jar project.q3 /user/hive/warehouse/h1b_final /niit/q31;
	hadoop fs -cat /niit/q31/p*;

        show_menu;
        ;;

	6) clear;
        option_picked "4)Which top 5 employers file the most petitions each year?";
	echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"	
		  read var
	     hive -e "select year, employer_name, count(employer_name) as total from h1b_final where year='$var' group by employer_name,year order by total desc limit 5;"	
        show_menu;
        ;;
           
	7) clear;
        option_picked "5 a) Find the most popular top 10 job positions for H1B visa applications for each year?";
	    echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
	    hive -e "select year, job_title, count(job_title) as count_job from h1b_final where year='$var' group by job_title,year order by count_job desc limit 10;"
        show_menu;
        ;;

	8) clear;
        option_picked "5 b) Find the most popular top 10 job positions for certified H1B visa applications for each year?";
	    echo -e "Enter the year (1-2011, 2-2012, 3-2013, 4-2014, 5-2015, 6-2016)";
		read n
		case "$n" in
			"1")
			pig /home/user/Documents/H1B_Project/Pig/Q5b/q5b_2011.pig
        show_menu;
        ;;

			"2")
			pig /home/user/Documents/H1B_Project/Pig/Q5b/q5b_2012.pig
        show_menu;
        ;;

			"3")
			pig /home/user/Documents/H1B_Project/Pig/Q5b/q5b_2013.pig
        show_menu;
        ;;

			"4")
			pig /home/user/Documents/H1B_Project/Pig/Q5b/q5b_2014.pig
        show_menu;
        ;;
			"5")
			pig /home/user/Documents/H1B_Project/Pig/Q5b/q5b_2015.pig
        show_menu;
        ;;
			"6")
			pig /home/user/Documents/H1B_Project/Pig/Q5b/q5b_2016.pig
        show_menu;
        ;;
		esac
        show_menu;
        ;;
       
	9) clear;
	option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";
		echo -e "case_status (1-CERTIFIED,2-CERTIFIED-WITHDRAWN,3-WITHDRAWN,4-DENIED)";
		read n
		case "$n" in
			"1")
			pig /home/user/Documents/H1B_Project/Pig/Q6/q6_cert.pig;
	;;

			"2")
			pig /home/user/Documents/H1B_Project/Pig/Q6/q6_certwd.pig;
	;;
       

			"3")
			pig /home/user/Documents/H1B_Project/Pig/Q6/q6_with.pig;
	;;
       

			"4")
			pig /home/user/Documents/H1B_Project/Pig/Q6/q6_den.pig;
	;;
       		
		esac
        show_menu;
        ;;  

	10) clear;
        option_picked "7) Create a bar graph to depict the number of applications for each year";
			hadoop fs -rmr /niit/q71
        hadoop jar h1b.jar project.q7 /user/hive/warehouse/h1b_final /niit/q71;
	hadoop fs -cat /niit/q71/p*;
		
        show_menu;
        ;;           
        
	11) clear;
        option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
		echo -e "Enter the year(2011,2012,2013,2014,2015,2016)"
		read year
		echo -e "Enter the choice Full time position/ Part time position.(Y/N)"
		read var
        hive -e "select year,job_title,avg(prevailing_wage) as avg_wage from h1b_final where full_time_position='$var' and year = '$year' group by year,job_title order by avg_wage desc;"
        show_menu;
        ;;

	12) clear;
		option_picked "9) Which are the employers who have highest success rate in petitions more than 70%and total petions filed more than 1000?"
		hadoop fs -rmr /niit/q91
        hadoop jar h1b.jar project.q9 /user/hive/warehouse/h1b_final /niit/q91;
	hadoop fs -cat /niit/q91/p*;
        show_menu;
        ;;

	
	13) clear;
		option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
		hadoop fs -rmr /niit/q101
        hadoop jar h1b.jar project.q10 /user/hive/warehouse/h1b_final /niit/q101;
	hadoop fs -cat /niit/q101/p*;
        show_menu;
        ;;

	14) clear;
		option_picked "11) Export result of q10 to mysql"
		mysql -u root -p 'hduser'
        show_menu;
        ;;

	
        \n) exit;
        ;;

        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi



done


