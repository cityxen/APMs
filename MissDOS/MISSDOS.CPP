/***********************************************************************
** MISS DOS                                                           **
************************************************************************
** Deadline / CityXen                                                 **
** DOS program for MISS DOS APM, compile with Borland Turbo C++ (DOS) **
** https://youtube.com/cityxen                                        **
************************************************************************
** History:                                                           **
**                                                                    **
** 08/02/2021:                                                        **
**     - v0.1.1a                                                      **
**     - Added Eyes                                                   **
**                                                                    **
** 07/27/2021:                                                        **
**     - v0.1a                                                        **
**     - Created MISSDOS.CPP                                          **
**                                                                    **
************************************************************************/

#define VERSION "0.1.1a"
#define DDATE "08/02/2021"
#include<stdio.h>
#include<conio.h>
#include "stdlib.h"

#define COLOR_MISSDOS RED
#define COLOR_CLONE   GREEN
#define EYES 2
#define MAXEYES 5
#define MOUTH 4
#define MAXMOUTH 5

#define DIALOGUE 0
#define MAXDIALOGUE 10

unsigned int eyes;
unsigned int mouth;
unsigned int dialogue;
char key;
unsigned char pch;

void draweyes(unsigned int e);
void drawmouth(unsigned int m);
void writedialogue(unsigned int d);

void main() {

    clrscr();
    textcolor(COLOR_MISSDOS);
    cprintf("===============================================================================\n\r");
    cprintf("MISS DOS v%s by Deadline/CityXen %s - https://youtube.com/cityxen/\n\r",VERSION,DDATE);
    cprintf("===============================================================================\n\r");
    eyes=EYES;
    mouth=MOUTH;
    cprintf("EYES: %d, MOUTH: %d - ",eyes,mouth);
    cprintf("MAXEYES: %d, MAXMOUTHS: %d\n\r",MAXEYES,MAXMOUTH);
    cprintf("===============================================================================\n\r");
    cprintf("DOS Characters available:\n\r");
    cprintf("===============================================================================\n\r");
    for(pch=176;pch<255;pch++) { cprintf("[%d:%c] ",pch,pch); }
    cprintf("\n\r");
    cprintf("===============================================================================\n\r");
    cprintf("Press any key to begin.\n\r");
    cprintf("===============================================================================\n\r");
    key=getch();
    clrscr();
    _setcursortype(_NOCURSOR);

    while(1) {
	key=getch();

	switch(key) {

	    case 27:
		exit(0);
		break;
	    case 8:
		break;
	    case 13:
		break;

	    // Eyes keys
	    case '0':
		draweyes(0);
		break;
	    case '1':
		draweyes(1);
		break;

	    case '2':
		draweyes(2);
		break;

	    case '3':
		draweyes(3);
		break;

	    // Mouth keys

	    case 'a':
		drawmouth(1);
		break;

	    default:
		// cprintf("%c",key);
		// cprintf("[%d] ",key);
		break;
	}
    }
}

// 176 = light, 177 = med, 178 = dark
void draweyes(unsigned int e) {

    gotoxy(11,11);

    switch(e){

	case 0:
	    cprintf("   ");
	    break;

	case 1:
	    cprintf(" ± ");
	    break;

	case 2:
	    cprintf(" _ ");
	    break;

	case 3:
	    cprintf(" O ");

	    break;

	default:

	    break;


    }

}

void drawmouth(unsigned int m) {


}

