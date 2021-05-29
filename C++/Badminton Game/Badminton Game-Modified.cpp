#include<bits/stdc++.h>
#include <iostream>
#include <windows.h>
#include <cstdlib>
#include<conio.h>
#include<time.h>
using namespace std;


void cls();
//

int rows = 21 ,cols = 21;
char grid[21][21];
string player_name;

int feather_pos_x = 0, feather_pos_y = 5;
int pre_feather_pos_x = 0, pre_feather_pos_y = 0;

int computer_pos_x = 0, computer_pos_y = 5;
int pre_computer_pos_x = 0, pre_computer_pos_y = 0;

int player_pos_x = rows-1, player_pos_y = 15;
int pre_player_pos_x = 0, pre_player_pos_y = 0;


int score = 0;

bool down = true, up = false;

bool _game_over = false;

///key press
bool _left_key = false ,_right_key = false;




void set_default_values()
{
    rows = 21 ,cols = 21;

    feather_pos_x = 0, feather_pos_y = 5;
    pre_feather_pos_x = 0, pre_feather_pos_y = 0;

    computer_pos_x = 0, computer_pos_y = 5;
    pre_computer_pos_x = 0, pre_computer_pos_y = 0;

    player_pos_x = rows-1, player_pos_y = 15;
    pre_player_pos_x = 0, pre_player_pos_y = 0;


    score = 0;

    down = true, up = false;

    _game_over = false;

    ///key press
    _left_key = false ,_right_key = false;
}


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





void delay(clock_t a)
{
    clock_t start;
    start  = clock();
    while(clock()-start<a)
    {
        ///delaying
    }
    ///end of function
}


void game_start()
{
    string game_name = "Badminton Game", press_any_key = "Press any key to continue........";

    for(int x=0;x<10;x++) printf("\n");

    for(int x=0;x<6;x++) printf(" ");
    for(int x=0; game_name[x]!='\0'; x++)
    {
        printf("%c",game_name[x]);
        delay(40);
    }

    printf("\n");


    for(int x=0;x<6;x++) printf(" ");
    delay(1000);
    for(int x=0; press_any_key[x]!='\0'; x++)
    {
        printf("%c",press_any_key[x]);
        delay(10);
    }

    char ch = getch();
    if(ch)
    {
        system("cls");
    }

    for(int x=0; x<rows; x++)
    {
        for(int y=0; y<cols; y++)grid[x][y]= ' ';
    }


    ///end of function
}


void game_over()
{

    for(int x=0;x<2;x++) printf("\n");

    printf("        ");
    printf("Your Score = %d\n",score);

    //printf("        ");
    printf("\n");

    string str = " - - - - - - Game Over - - - - - - ";
    for(int x=0; str[x]!='\0'; x++)
    {
        printf("%c",str[x]);
        delay(10);
    }



    //getchar();



}



void player_info()
{
    for(int x=0;x<10;x++) printf("\n");

    for(int x=0;x<6;x++) printf(" ");

    string str = "Enter your name: ";
    for(int x=0; str[x]!='\0'; x++)
    {
        printf("%c",str[x]);
        delay(10);
    }
    //c in >> player_name;
    //c in.ignore();//ignore new line or space
    //getchar();
    //getline(cin,player_name);
    cin>>player_name;
    //c out << player_name;
    system("cls");
    ///end of function
}


void playing_instruction()
{
    for(int x=0;x<10;x++) printf("\n");

    for(int x=0;x<6;x++) printf(" ");

    string str = "Press 'Left' and 'Right' key to move player.... ";
    for(int x=0; str[x]!='\0'; x++)
    {
        printf("%c",str[x]);
        delay(10);
    }

    char ch = getch();
    if(ch)
    {
        system("cls");
    }

}



void feather_pos(int _pos_x, int _pos_y)
{
    if(down == true)
    {
        if(_pos_x == rows-1 ) _game_over = true; ///game over


        if(grid[_pos_x+1][_pos_y] == 'P' /* || _pos_x+1 > rows-1*/ )
        {
            down = false; up = true;
            score++;
        }
        else
        {
            feather_pos_x = _pos_x+1;
            feather_pos_y = _pos_y;
        }
    }



    if(up == true)
    {
        if(grid[_pos_x-1][_pos_y] == 'C' || _pos_x-1 < 0 )
        {
            up = false; down = true;

            ///changing computer and feather cols
            feather_pos_y = int(rand())%cols;  if(feather_pos_y==0)feather_pos_y=cols/2;
            computer_pos_y = feather_pos_y;
            pre_computer_pos_y = _pos_y;


        }
        else
        {
            feather_pos_x = _pos_x-1;
            feather_pos_y = _pos_y;
        }
    }






    pre_computer_pos_x = 0;
    pre_computer_pos_y = _pos_y;

    pre_feather_pos_x = _pos_x;
    pre_feather_pos_y = _pos_y;



    ///ckeck
/*
    if(feather_pos_x==0 && feather_pos_y==0)
    {
        cout<<grid[0][0]<<endl;
        getch();
        getch();
    }
*/

    ///end of function
}







void player_input(int time)
{

    clock_t endWait;
    endWait=clock()+time;

    while (clock()<=endWait )
    {
        if (GetAsyncKeyState(VK_LEFT)& 0x0001)
        {
           _left_key = true;
        }
        if (GetAsyncKeyState(VK_RIGHT)& 0x0001)
        {
           _right_key = true;
        }
    }

    ///end of function
}






void player_pos(int _pos_x, int _pos_y)
{
    if(_left_key==true)
    {
       if(_pos_y-1 >= 0 )
       {
           player_pos_y = _pos_y-1;

           pre_player_pos_x = _pos_x;
           pre_player_pos_y = _pos_y;

           _left_key = false;
       }
    }


    if(_right_key==true)
    {
       if(_pos_y+1 <= cols-1 )
        {
            player_pos_y = _pos_y+1;

            pre_player_pos_x = _pos_x;
            pre_player_pos_y = _pos_y;

           _right_key = false;
       }
    }


    ///end of function
}



void start_play()
{
    for(int x=0; x<rows; x++) grid[x][cols/2]='.';
    for(int x=0; x<cols; x++) grid[rows/2][x]='-';

    grid[pre_computer_pos_x][pre_computer_pos_y] = ' ';

    grid[pre_feather_pos_x][pre_feather_pos_y] = ' ';
    if(pre_feather_pos_x == rows/2)grid[pre_feather_pos_x][pre_feather_pos_y] = '-';
    //'-' char correction after feather passes net

    grid[computer_pos_x][computer_pos_y] = 'C';

    //cout<<computer_pos_x<<" "<<computer_pos_y<<endl;

    player_input(1);

    player_pos(player_pos_x, player_pos_y);

    grid[pre_player_pos_x][pre_player_pos_y] = ' ';
    if(pre_player_pos_y == cols/2)grid[pre_player_pos_x][pre_player_pos_y] = '.';

    grid[player_pos_x][player_pos_y] = 'P';

    grid[feather_pos_x][feather_pos_y] = '@';
    feather_pos(feather_pos_x, feather_pos_y);


    printf("            Computer");
    printf("\n\n");

    for(int x=0; x<rows; x++)
    {
        setcursor(0,0);

        printf("   ");
        printf("|");
        for(int y=0; y<cols; y++)printf("%c",grid[x][y]);
        printf("|\n");
    }

    printf("\n\n");
    printf("            ");
    cout<<player_name;


    //cls();
    //std::cout.flush();
    if(!_game_over)
    {
        delay(20);
        system("cls");

        start_play();
    }
    else
    {
        game_over();
    }


    ///end of function
}




void play_again()
{
    printf("\n\n    ");
    printf("If you want to play again , press '1'");

    char ch = ' ';

    while(ch != '1')ch = getch();

    cout<<"-"<<ch<<"-"<<endl;

    if(ch == '1')
    {
        ch = ' ';

        for(int x=0; x<rows; x++)
        {
            for(int y=0; y<cols; y++)grid[x][y]= ' ';
        }

        set_default_values();
        start_play();

    }


}






int main()
{
    game_start();
    player_info();
    playing_instruction();
    start_play();


    loop:
    play_again();
    goto loop;

    getchar();



}










/*
void cls()
{
    // Get the Win32 handle representing standard output.
    // This generally only has to be done once, so we make it static.
    static const HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);

    CONSOLE_SCREEN_BUFFER_INFO csbi;
    COORD topLeft = { 0, 0 };

    // std::cout uses a buffer to batch writes to the underlying console.
    // We need to flush that to the console because we're circumventing
    // std::cout entirely; after we clear the console, we don't want
    // stale buffered text to randomly be written out.
    std::cout.flush();

    // Figure out the current width and height of the console window
    if (!GetConsoleScreenBufferInfo(hOut, &csbi)) {
        // TODO: Handle failure!
        abort();
    }
    DWORD length = csbi.dwSize.X * csbi.dwSize.Y;

    DWORD written;

    // Flood-fill the console with spaces to clear it
    FillConsoleOutputCharacter(hOut, TEXT(' '), length, topLeft, &written);

    // Reset the attributes of every character to the default.
    // This clears all background colour formatting, if any.
    FillConsoleOutputAttribute(hOut, csbi.wAttributes, length, topLeft, &written);

    // Move the cursor back to the top left for the next sequence of writes
    SetConsoleCursorPosition(hOut, topLeft);




    ///void setCursorPosition(int x, int y)
    {
        int x=0,y=0;
        static const HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
        std::cout.flush();
        COORD coord = { (SHORT)x, (SHORT)y };
        SetConsoleCursorPosition(hOut, coord);
    }
}

*/
