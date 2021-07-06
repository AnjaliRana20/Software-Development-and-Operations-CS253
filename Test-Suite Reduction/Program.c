#include <stdio.h>

// checking parity of numbers

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    if(a%2==0){
        if(b%2==0){
            printf("[message] a and b have same parity (both even)");
        }
        else {
            printf("[message] a and b have different parity (a is even and b is odd)");
        }
    }   
    else{
        if(b%2!=0){
            printf("[message] a and b have same parity (both odd)");
        }
        else {
            printf("[message] a and b have different parity (a is odd and b is even)");
        }
    } 
    
  return 0;
}