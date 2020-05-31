#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

extern "C" {int addTwo (int*a,int*b);}

int main(){

	int x =5;
	int y=10;
	
	int*ptrx=&x;
	int*ptry=&y;
	
	cout<<"Welcome to addtional program"<<endl;
	int re= addTwo(ptrx,ptry);
	
	
	cout<<"The additional of the two parameter is "<<ret<<endl;



}
