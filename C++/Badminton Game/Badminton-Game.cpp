#include<bits/stdc++.h>
#include<conio.h>
#include <windows.h>
#include<time.h>
using namespace std;


///cursor control
///cursor control
HANDLE console = GetStdHandle(STD_OUTPUT_HANDLE);

void setcursor(bool visible, DWORD size) // set bool visible = 0 - invisible, bool visible = 1 - visible
{
	if(size == 0)
	{
		size = 20;	// default cursor size Changing to numbers from 1 to 20, decreases cursor width
	}
	CONSOLE_CURSOR_INFO lpCursor;
	lpCursor.bVisible = visible;
	lpCursor.dwSize = size;
	SetConsoleCursorInfo(console,&lpCursor);
}
///cursor control
///cursor control

string player_name;


struct badminton
{
private:
    /* data */
public:
    badminton(/* args */);
    ~badminton();

    char grid[100][100];

    int n, row, col, score = 0;
    int delChange = 0;
    int featherCurrentPositionX, featherPreviousPositionX;
    int featherCurrentPositionY, featherPreviousPositionY;
    int computerCurrentPosition, computerPreviousPosition;
    int playerCurrentPosition, playerPreviousPosition;

    bool gameOver = false;
    bool toUp_isActive = false, toDown_isActive = true;

    bool _left_key = false ,_right_key = false;

    void changeScore();
    void toogleDirection();
    void moveFeather();
    void moveComputerPosition();
    void movePlayerPosition();
    void showGrid();
    void player_input(int time);
    void delay(clock_t a);
    void detectGameOver();
    void showGameOver();



};

badminton::badminton(/* args */)
{
}

badminton::~badminton()
{
}

void badminton::delay(clock_t a)
{
    clock_t start;
    start  = clock();
    while(clock()-start<a)
    {
        ///delaying
    }
    ///end of function
}

void badminton::player_input(int time)
{
    clock_t endWait;
    endWait=clock()+time;

    while(clock()<=endWait )
    {
        if (GetAsyncKeyState(VK_LEFT)& 0x0001)
        {
            //cout<<"left pressed"<<endl;
           _left_key = true;
        }
        if (GetAsyncKeyState(VK_RIGHT)& 0x0001)
        {
            //cout<<"right pressed"<<endl;
           _right_key = true;
        }
    }

    ///end of function
}

void badminton::changeScore()
{
    score++;
}

void badminton::toogleDirection()
{
    toUp_isActive ^= true;
    toDown_isActive ^= true;
    delChange *= -1;

    //cout<<" toUp_isActive =  "<<toUp_isActive<<endl;
    //cout<<" toDown_isActive =  "<<toDown_isActive<<endl;
    //cout<<" delChange =  "<<delChange<<endl;
}

void badminton::moveFeather()
{
    featherCurrentPositionX += delChange;

    if(toUp_isActive && featherCurrentPositionX==2)
    {
        toogleDirection();
        moveComputerPosition();
    }
    if(toDown_isActive && featherCurrentPositionX==row-2)
    {
        if(featherCurrentPositionY == playerCurrentPosition
            || featherCurrentPositionY == playerCurrentPosition-1
            || featherCurrentPositionY == playerCurrentPosition+1)
        {
            toogleDirection();
            changeScore();
        }
    }
}

void badminton::moveComputerPosition()
{
    int random = -1;
    while(random<=1 || random>=col-1)
    {
        random = sqrt(rand())*(rand()*11);
        random = random%col;
    }
    computerCurrentPosition = random;
    featherCurrentPositionY = random;
}

void badminton::movePlayerPosition()
{
    if(_left_key==true)
    {
        if(playerCurrentPosition-1>1) playerCurrentPosition -= 1;
        _left_key = false;
    }
    if(_right_key==true)
    {
        if(playerCurrentPosition+1<col-1) playerCurrentPosition += 1;
        _right_key = false;
    }
}

void badminton::detectGameOver()
{
    if(toDown_isActive && featherCurrentPositionX==row-2)
    {
        gameOver = true;
    }
}

void badminton::showGameOver()
{
    printf("\n");
    printf("Your Score = %d\n", score);
    printf("\n");
    string str = "- - - - Game Over - - - -";
    cout<<str;
}

void badminton::showGrid()
{
    //setcursor(0,0);
    for(int i=1; i<row; i++)
    {
        setcursor(0,0);
        for(int j=1; j<col; j++)
        {
            setcursor(0,0);
            grid[i][j]=' ';
            if(i==1 )
            {
                if(j==computerCurrentPosition-1) grid[i][j]='C';
                else if(j==computerCurrentPosition) grid[i][j]='C';
                else if(j==computerCurrentPosition+1) grid[i][j]='C';
            }
            if(i== row/2 ) grid[i][j]='-';
            if(i==row-1)
            {
                if(j==playerCurrentPosition-1) grid[i][j]='P';
                else if(j==playerCurrentPosition) grid[i][j]='P';
                else if(j==playerCurrentPosition+1) grid[i][j]='P';
            }

            if(i==featherCurrentPositionX && j==featherCurrentPositionY) grid[i][j]='@';
            printf("%c", grid[i][j]);
        }
        printf("\n");
    }
}


void start()
{
    for(int x=0;x<10;x++) printf("\n");
    //for(int x=0;x<6;x++) printf(" ");
    printf(" ");
    badminton ob;
    ob.delay(1000);

    string ss = " Badminton Game ";
    for(int x=0; ss[x]!='\0'; x++)
    {
        printf("%c",ss[x]);
        ob.delay(10);
    }
    ob.delay(2000);
    system ("CLS");
}


void player_info()
{
    for(int x=0;x<10;x++) printf("\n");
    //for(int x=0;x<6;x++) printf(" ");
    printf(" ");
    badminton ob;
    ob.delay(1000);

    string str = "Enter your name: ";
    for(int x=0; str[x]!='\0'; x++)
    {
        printf("%c",str[x]);
        ob.delay(10);
    }

    cin>>player_name;
    system ("CLS");
}


void playing_instruction()
{
    for(int x=0;x<10;x++) printf("\n");
    //for(int x=0;x<6;x++) printf(" ");
    printf(" ");

    badminton ob;
    string str = "Press 'Left' and 'Right' key to move player.... ";
    for(int x=0; str[x]!='\0'; x++)
    {
        printf("%c",str[x]);
        ob.delay(10);
    }

    char ch = getch();
    if(ch)
    {
        system ("CLS");
    }

}

void play_again();

void play_game()
{
    badminton playObj;
    playObj.n = 11;
    playObj.row = 21;
    playObj.col = 11;
    playObj.featherCurrentPositionX = 2;
    playObj.featherCurrentPositionY = (1+playObj.col)/2;
    playObj.delChange = 1;

    playObj.row++;
    playObj.col++;
    playObj.computerCurrentPosition = playObj.col/2;
    playObj.playerCurrentPosition = playObj.col/2;
    //cout<<playObj.computerCurrentPosition<<endl;
    //cout<<playObj.playerCurrentPosition<<endl;

    system ("CLS");
    playObj.showGrid();

    playObj.delay(500);

    for(int i=1; !playObj.gameOver; i++)
    {
        playObj.moveFeather();
        playObj.player_input(1);
        playObj.movePlayerPosition();
        playObj.detectGameOver();
        playObj.delay(10);

        system ("CLS");
        playObj.showGrid();
    }

    system ("CLS");
    playObj.moveFeather();
    playObj.showGrid();
    playObj.showGameOver();

    play_again();
}

void play_again()
{
    //printf("\n\n    ");
    printf("\n\n");
    cout<<"Hey "<<player_name<<", ";
    printf("If you want to play again , press '1' else press '2'");

    char ch = ' ';
    while(ch < '1' || ch > '2') ch = getch();
    //cout<<"-"<<ch<<"-"<<endl;
    if(ch == '1') play_game();
    else if(ch == '2')
    {
        system ("CLS");
        cout<<"\n\n\n\n\n\n\n- - - Game Ended - - -\n\n\n\n\n\n\n";
        return;
    }
}

int main()
{
    top:
    start();
    player_info();
    playing_instruction();
    play_game();
    //play_again();


}
