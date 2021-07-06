#!/bin/bash

mkdir -p temp/
cd temp/
gcc -Wall -g -fprofile-arcs -ftest-coverage ../Program.c -o ./Program;
sed -n 2p ../input_tests/T.in | ./Program > output;
gcov -b -c ./Program > output;
T_tests_count=$(sed -n 1p ../input_tests/T.in ); 
(( branch_count = $(grep "branch" Program.c.gcov | wc -l) ));
echo $T_tests_count > ../algo_input;
echo $branch_count >> ../algo_input;
cd ..;
rm -r temp;

k=$1;
program_c=$2;
T_input=$3;

echo $k >> algo_input;
for (( j=2; j<=$T_tests_count+1; j++ )); do

gcc -Wall -g -fprofile-arcs -ftest-coverage ./Program.c -o ./Program;
sed -n "$j"p ./input_tests/T.in | ./Program > out;
gcov -b -c ./Program > out;
cat Program.c.gcov | grep "branch" > file_temp;

for (( i=1; i<=$branch_count; i++ )); do
a=$(sed -n "$i"p  file_temp | awk '{print $4}');
if [[ $a == 1 ]]; then echo "1" >> algo_input;
else echo "0" >> algo_input;
fi;
done;

done;

g++ algo_reduction.cpp -o ./algo && ./algo < algo_input > cout_file;


final_count=$(sed -n 1p cout_file);


touch ./input_tests/S.in;
echo $final_count > ./input_tests/S.in;

for (( a=2; a<=$(( final_count+1 )); a++ )); do
idx=$(sed -n "$a"p cout_file);

sed -n "$(( idx+1 ))"p input_tests/T.in >> ./input_tests/S.in;
done;

mkdir -p bin;
cd bin;
gcc -Wall -g -fprofile-arcs -ftest-coverage ../Program.c -o P;
echo "#1" > ../output;
sed -n 2p ../input_tests/S.in | ./P >> ../output;
echo "" >> ../output;
for (( i=3; i<=$(( final_count+1 )); i++ )); do
echo "#$(( i-1 ))" >> ../output;
sed -n "$i"p ../input_tests/S.in | ./P >> ../output;
echo "" >> ../output;
done;
gcov -b -c ./Program >> ../output;
cd ..;
rm out;
rm file_temp;
rm algo;
rm algo_input;
rm -r bin;
rm cout_file;
rm Program.c.gcov;
rm Program.gcno;
rm Program.gcda;
rm Program;
rm output; #comment this to see test results when S,in is run on Program.c