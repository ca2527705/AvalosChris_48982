/* 
 * File:   main.cpp
 * Author: rcc
 *
 * Created on October 26, 2015, 11:48 AM
 */

#include <cstdlib>
#include <ctime>
#include <iostream>

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    int answer;
    int roll;
    do{
    int roll1,roll2,roll3,roll4;
    srand(static_cast<int>(time(0)));
    roll1=(rand()%6)+1;
    roll2=(rand()%6)+1;
    cout<<"A "<<roll1<<" and a "<<roll2<<" was rolled\n";
    roll=roll1+roll2;
    cout<<"Your total is "<<roll<<endl;
    if (roll==7||roll==11)
        cout<<"You win!"<<endl;
    else if(roll==2||roll==12)
        cout<<"You lose!"<<endl;
    else
        for (int i=roll2;i==roll1;i++){
            do{
                srand(static_cast<int>(time(0)));
                roll3=(rand()%6)+1;
                roll4=(rand()%6)+1;    
                cout<<"Roll again!"<<endl;
                roll2=roll3+roll4;
                cout<<"You rolled a "<<roll2<<endl;
                cin>>answer;
                }while(roll2!=7||11);
        }
    cout<<"Roll again? press 1 for yes"<<endl;
    cin>>answer;
    }while(answer==1);

    return 0;
}

