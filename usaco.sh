TASK=$1

echo "
/*
ID: shubham180
LANG: C++
TASK: $TASK
*/

#include<bits/stdc++.h>
using namespace std;

int main(){
    ofstream fout("${TASK}.out");
    ifstream fin("${TASK}.in");
}
" > ${TASK}.cpp
