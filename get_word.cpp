#include<iostream>
#include<vector>
#include<stdlib.h>
#include<string.h>
#include<sstream>
using namespace std;

vector<string> word;
char *a;
void getWord(char *p)
{
    string s,a1;
    a1=p;
    int i;
    for(i=0;i<a1.size();i++)
    {
	if(a1[i]==':')
	{
	    i++;
	    break;
	}
    }
    while(i<a1.size())
    {
	if(a1[i]!=')')
	{
	   s+=a1[i];
	   i++;
	}
	else
	{
	   s+=')';
           word.push_back(s);
           s="";
           i++;
	}
    }
}

int main()
{
     a="A[51-161]:▒▒▒▒(51-86/100)▒▒▒▒(86-120/100)▒▒ô▒▒(120-161/100)";
     getWord(a);
     if(word.empty())
     {
	cout<<"empty";
     }
     cout<<word[0]<<" "<<word[1]<<" "<<word[2]<<endl;
     return 0;
}



