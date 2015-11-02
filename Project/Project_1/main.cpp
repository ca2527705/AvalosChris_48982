/* 
 * File:   main.cpp
 * Author: Christopher Avalos
 * Purpose: C version of assembly project
 * Created on October 26, 2015, 11:48 AM
 */
//System Libraires
#include <cstdlib>
#include <ctime>
#include <iostream>

using namespace std;\

//User libraries

//Global COnstants

//function Prototypes

//Fun Starts here!
int main(int argc, char** argv) {
    //intialize both the answer and roll, im keeping them as numbers for assembly
    //to be used later, so they can use 1s and 2s for answers
    int answer;
    int roll;
    cout<<"This is the game of craps! Try to roll the same number twice\n"
            "before you roll a 7, or roll a 7 or eleven on your first roll\n"
            "to win instantly!\n";
    do{
    //These are the different dice roll and their combinations
    int roll1,roll2,roll3,roll4,roll5;
    //seed the random number generator
    srand(static_cast<int>(time(0)));
    //first and second dice rolls
    roll1=(rand()%6)+1;
    roll2=(rand()%6)+1;
    //display the dice rolls
    cout<<"A "<<roll1<<" and a "<<roll2<<" was rolled\n";
    roll=roll1+roll2;
    cout<<"Your total is "<<roll<<endl;
    //win condition if they roll a 7 or an 11 on thier first roll
    if (roll==7||roll==11)
        cout<<"You win!"<<endl;
    //lose condition if they roll either a 2 or a 12 on thier first roll
    else if(roll==2||roll==12)
        cout<<"You lose!"<<endl;
    //if they dont win or lost on their first roll, they then have the option
    //of continuing to roll until they roll a 7 or 2
    else
            do{ 
                //the second dice roll
                roll3=(rand()%6)+1;
                roll4=(rand()%6)+1;    
                cout<<"Second Roll!"<<endl;
                roll5=roll3+roll4;
                cout<<"A "<<roll3<<" and a "<<roll4<<" was rolled\n";
                cout<<"You rolled a "<<roll5<<endl;
                //reshow the number needed in case they roll alot
                cout<<"You need a  "<<roll<<endl;
                //if the numbers are equal, game ends
                if(roll5==roll){
                    cout<<"You win!"<<endl;
                }
                //if second roll hits a 7, they lose
                else if(roll5==7){
                    cout<<"You Lose!"<<endl;
                }
                //keep rolling until they either get equal numbers or they hit 7
                else if((roll5!=roll)){
                   cout<<"Roll again? press 1 for yes"<<endl;    
                   cin>>answer; 
                }
                //ask them if they want to play again
                }while((answer==1)&&(roll5!=7)&&(roll5!=roll));
                cout<<"Play again?\n";
                cout<<"Enter 1 for yes"<<endl;
                cin>>answer;
    }while(answer==1);

    return 0;
}

