#include<iostream>
#include<string>
#include<iomanip>
using namespace std;
int menu();
int GetRightElection();
void RandomElection(int number,float votes[][6]);
void display(float votes[][6],int number);
void percentage(float votes[][6], float percent[][6]);
void resetVotes(float votes[][6]);
int main()
{
	float votes[7][6] = { };
	float percent[7][6] = { };
	int c,num;
	do{
		c = menu();
		if(c == 1){
		num = GetRightElection();
		resetVotes(votes);
		}
		if(c == 2)
		RandomElection(num,votes);
		if(c == 3)
		display(votes,num);
	}while(c != 4);
	system("pause");
	return 0;
}
int menu(){
	int num;
	string line(30,'=');
	cout << line << endl;
	cout << "\tElection Main Menu\t\n";
	cout << line << endl;
	cout << " 1. Input Number of Right Election (1000-5000)\n";
	cout << " 2. Random Result Election\n";
	cout << " 3. Report Election\n";
	cout << " 4. Exit\n";
	cout << "Enter choice : ";
	cin >> num;
	return num;
}
int GetRightElection(){
	int number;
	cout << "Enter number of right election : ";
	cin >> number;
	if(number > 5000) 
		number = 5000;
	if(number < 1000) 
		number = 1000;
	cout << "Number of right election Now to " << number << endl;
	cout << endl;
	return number;
}
void RandomElection(int number,float votes[][6]){
	int vote;
	for(int n = 0 ; n < 7 ; n++){
		for(int i = 0 ; i < number ; i++){
		vote = rand() % 5;
		if (vote == 0)
			votes[n][0] += 1;
		if (vote == 1) 
			votes[n][1] += 1;
		if (vote == 2)
			votes[n][2] += 1;
		if (vote == 3)
			votes[n][3] += 1;
		if (vote == 4)
			votes[n][4] += 1;
		votes[n][5] = votes[n][0] + votes[n][1] + votes[n][2] + votes[n][3] + votes[n][4];
		}
	}
	cout << endl;
	cout << "Start to random . . . \n";
	cout << "\nNow finish random . . .\n\n";
}
void display(float votes[][6], int number){
	string line(111,'=');
	cout << line << endl;
	cout << "|Destrict|No. Vote|   %   |  No. 1 |   %   |  No. 2 |   %   |  No. 3 |   %   | No. 4  |   %   | Total |   %   |\n";
	cout << line << endl;
	for(int n = 0 ; n < 7 ; n++){
		cout << "|" << setw(5) << n + 1 << "   |";
		cout << setw(8) << votes[n][0] << "|";
		cout << fixed << setprecision(2) << setw(7) << votes[n][0] / number * 100.00f << "|";
		cout << setprecision(0) << setw(8) << votes[n][1] << "|";
		cout << setw(7) << setprecision(2) << votes[n][1] / number * 100.00f << "|";
		cout << setprecision(0) << setw(8) << votes[n][2] << "|";
		cout << setw(7) << setprecision(2) << votes[n][2] / number * 100.00f << "|";
		cout << setprecision(0) << setw(8) << votes[n][3] << "|";
		cout << setw(7) << setprecision(2) << votes[n][3] / number * 100.00f << "|";
		cout << setprecision(0) << setw(8) << votes[n][4] << "|";
		cout << setw(7) << setprecision(2) << votes[n][4] / number * 100.00f << "|";
		cout << setprecision(0) << setw(7) << votes[n][5] << "|";
		cout << setw(7) << setprecision(2) << votes[n][5] / number * 100.00f << "|";
		cout << setprecision(0);
		cout << endl;
	}
	cout << line << endl;
	cout << endl;
}
void resetVotes(float votes[][6]) {
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 6; j++) {
            votes[i][j] = 0;
        }
    }
}
