#!bin/bash

#script for generating n test cases

n=${1};
program_c=${2};
mkdir -p input_tests;

echo $n > input_tests/T.in;
for (( i=1; i<=$n; i++ )); do
(( input_1 = $RANDOM*$RANDOM - 250000000 ));
(( input_2 = $RANDOM*$RANDOM - 250000000 ));
echo $input_1 $input_2 >> input_tests/T.in; 
done;

#tests the branch coverage of n test cases in T.in
n=$(sed -n 1p input_tests/T.in);
mkdir -p T_outputs;
mkdir -p bin;
cd bin;

gcc -Wall -g -fprofile-arcs -ftest-coverage -o Program ../Program.c;
echo "" > ../n_output;

for (( i=2; i<=$n+1; i++ )); do
echo "$(( i-1 ))." >> ../n_output;
cat ../input_tests/T.in | sed -n "$i"p | ./Program >> ../n_output;
echo"">> ../n_output;
done;
gcov -b -c ./Program.c > ../n_gcovfile;

mv ../n_gcovfile ../T_outputs;
mv ../n_output ../T_outputs;

cd ..;
rm -r bin;
rm -r T_outputs;    #comment this to see outputs
