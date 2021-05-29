#include <bits/stdc++.h>
#include <windows.h>
#include <string>
using namespace std;


string team = " ";
string player[11];
int score = 0, wicket = 0;
int over = 0, ball = 0;
int over_limit = 0;
string pl1_name = " ", pl2_name = " ";
int pl1_score = 0, pl2_score = 0;
int pl1_ball = 0, pl2_ball = 0;
bool pl1_on_strike = false, pl2_on_strike = false;
char pl1_status = ' ',pl2_status = ' ';
int next_pl_num = 0;
double run_rate = 0.00, economy = 0.00;
string history = " ";
string last_last_over = "", last_over = "", this_over = "";


void show()
{

    system("CLS");

    if(pl1_on_strike == true)
    {
        pl1_status = '*';
        pl2_status = ' ';
    }
    else
    {
        pl1_status = ' ';
        pl2_status = '*';
    }



    printf("\n\n                                      Cricket Scoreboard\n");

    printf(" _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _");
    printf("\n\n");

    printf(" \\     %s %d - %d      ||      %c[%s] %d(%d)       %c[%s] %d(%d) \\"
           ,team.c_str(),score,wicket,pl1_status,pl1_name.c_str(),pl1_score,pl1_ball,pl2_status,pl2_name.c_str(),pl2_score,pl2_ball);
    printf("\n");

    printf("  \\--------------------------------------------------------------------------------------------------");
    printf("\n");

    printf("   \\    Over: %d.%d   ||   RUN Rate: %.2lf/Over  History:( %s)",over,ball,run_rate,history.c_str());
    printf("\n");

    printf("    \\_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _");
    printf("\n");




    if(over == over_limit) return;


    char c ;
    string str = "";
    cout<<"This ball: "
    cin>>str;

    if(str>="0" && str<="9")
    {
        c = str[0];
        int run = c - '0';

        score += run;
        ball += 1;

        if(pl1_on_strike == true)
        {
            pl1_ball += 1;
            pl1_score += run;
        }
        else
        {
            pl2_ball += 1;
            pl2_score += run;
        }

        if( run%2 == 1 )
        {
            swap(pl1_on_strike,pl2_on_strike);
        }
    }

    else
    {

        if( str=="w" || str=="W" )
        {
            wicket++;
            ball += 1;

            if(pl1_on_strike == true)
            {
                pl1_name = player[next_pl_num];
                pl1_score = 0;
                pl1_ball = 0;
            }
            else
            {
                pl2_name = player[next_pl_num];
                pl2_score = 0;
                pl2_ball = 0;
            }


            next_pl_num += 1;

        }

        else if( str=="wd" || str=="WD" || str=="nb" || str=="NB" )
        {
            score += 1;

        }


    }


    int total_ball = ( over*6 ) + ball;
    run_rate = ( double(score) / double(total_ball) ) * 6.00;

    this_over += str+" ";
    history = last_last_over + last_over + this_over;

    if(ball>=6)
    {

        over += 1;
        ball = 0;

        //change side
        swap(pl1_on_strike,pl2_on_strike);

        last_last_over = last_over;
        last_over = this_over + " | ";
        this_over = " ";

    }




    show();

}



int main()
{

    printf("Enter Team Name\n");
    cin>>team;

    printf("Enter all Player Names\n");
    for(int x = 0; x<11; x++)
    {
        printf("%2d. ",x+1);
        cin>>player[x];
    }

    printf("Enter Total Over\n");
    cin>>over_limit;

    printf("use 'W' for Wicket,'WD' for Wide, 'NB' for No Ball,\n");
    printf("and '1 - N' as Run(s) per Ball.\n");

    pl1_name = player[0];
    pl2_name = player[1];

    pl1_on_strike = true;
    pl2_on_strike = false;

    next_pl_num = 2;

    show();


    printf("\n\n- - - - - - - - - - - - - Over Ended - - - - - - - - - - - - - \n");

}
