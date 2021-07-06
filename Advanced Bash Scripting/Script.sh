#!/bin/bash

echo "STATE, DISTRICT, CONFIRMED CASES, RECOVERY RATE" > processed_Covid_Data_190147.csv; #Redirecting headings to csv file.

states_count=$(jq 'del(.TT) | length' covid_Data.json);    #Counts no. of states in covid_Data.json
for (( i=0; i<states_count; i++ )); do
    state_code=$(jq 'del(.TT) | keys | .['$i']' covid_Data.json);	#Gives state code of ith state
    state_code_without_quotes=`echo "$state_code" | sed -e 's/^"//' -e 's/"$//'`;	#Removes double quotes from start and ending of state code.
    number_of_dist=$(jq 'del(.TT) | map(.) | .['$i'] | .districts | length' covid_Data.json);	#Gives no. of districts in the ith state.
    max_rec_rate=0;	#initialising maximum recovery rate of ith state as 0
    req_conf_cases=0;	#initialising confirmed cases of the required district of ith state as 0
    req_dist=NULL;	#initialising required district's name as NULL
    for (( j=0; j<=number_of_dist; j++ )); do
        Confirmed_Cases=$(jq 'del(.TT) | map(.) | .['$i'] | .districts | map(.) | .['$j'] | .total.confirmed' covid_Data.json);		#Gives no. of confirmed cases of jth district of ith state
        Recovered_Cases=$(jq 'del(.TT) | map(.) | .['$i'] | .districts | map(.) | .['$j'] | .total.recovered' covid_Data.json);		#Gives no. of recovered cases of jth district of ith state
        Dist_Name=$(jq 'del(.TT) | map(.) | .['$i'] | .districts | keys | .['$j']' covid_Data.json);	#Gives name of jth district
        Dist_Name_without_quotes=`echo "$Dist_Name" | sed -e 's/^"//' -e 's/"$//'`;	#Removes double quotes from start and ending of district name (required to compare the district name with "Unknown") 
        if [[ $Dist_Name_without_quotes != Unknown ]]; then
            if (( $Confirmed_Cases >= 5000 )); then
                Recovery_Rate=$(echo "scale=2 ; $Recovered_Cases * 100 / $Confirmed_Cases" | bc);		#Calculates recovery rate upto two decimal places	
                if (( $(echo "$Recovery_Rate >= $max_rec_rate" | bc) )); then		#The command in if condition calculates recovery rate upto two decimal places
                    max_rec_rate=$Recovery_Rate;
                    req_dist=$Dist_Name_without_quotes;
                    req_conf_cases=$Confirmed_Cases;
                fi;
            fi;
        fi;
    done;
    if [[ $max_rec_rate != 0 ]]; then
    echo "$state_code_without_quotes, $req_dist, $req_conf_cases, $max_rec_rate" >> processed_Covid_Data_190147.csv;		#Redirecting the required outputs to the csv file
    fi;
done;
