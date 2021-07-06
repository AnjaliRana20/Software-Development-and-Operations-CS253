#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

int main(){
    int test_cnt;   //n
    int branch_cnt; //no. of branches in Program.c
    int k;  //maximum allowed test cases
    cin>>test_cnt>>branch_cnt>>k;
    vector<vector<int>> coverage(test_cnt, vector<int> (branch_cnt));   //double array in which rows represent ith test case and columns represent branches
    vector<int> required_tests; //array which stores minimum value of test cases which make branch coverage closest to original
    int test_index;
    int max_cnt=0,cnt;
    vector<int> covered_branches(branch_cnt,0); //array representing the branches which get covered(if value at ith index is 1 this means that branch is not yet covered by any test case) 
    for(int a=0; a<test_cnt; a++){
        for(int b=0; b<branch_cnt; b++){
            cin>>coverage[a][b];    //takes input from cppfileinputs in which the ith test case's jth column is 1 if that test case covers jth branch
            if(coverage[a][b]==1) covered_branches[b]=1;
            
        }
        
    } 
    vector<int>::iterator it;
    while(k--){
        max_cnt=0;
        it = find(covered_branches.begin(), covered_branches.end(), 1);
        if(it==covered_branches.end()) break;   //this means all the branches have been covered
        for (int i=0; i<test_cnt; i++){
            cnt=0;
            for (int j=0; j<branch_cnt; j++){
                if(coverage[i][j]){
                    if(covered_branches[j]){    // to ensure we select the maximum disjoin set of branches we take only those branches which are not yet discovered by any test case
                        cnt+=1;
                    }
                }
                if(cnt>=max_cnt){
                    test_index=i;
                    max_cnt=cnt;
                }
            }
        }
        required_tests.push_back(test_index);
        for(int l=0; l<branch_cnt; l++){
        if(coverage[test_index][l]==1) covered_branches[l]=0;   //these branches are covered by test_indexth input
        }
    }
    cout<<required_tests.size()<<'\n';
  
    for(int i=0; i<required_tests.size(); i++) cout<<required_tests[i]+1<<'\n';
}