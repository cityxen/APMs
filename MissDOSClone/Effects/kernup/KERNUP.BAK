/***********************************************************************
**  MISS DOS                                                          **
************************************************************************
** Pokey Terminal Program (At end of Therapy)                         **
** https://youtube.com/cityxen                                        **
************************************************************************/

#define VERSION "0.1a"
#include<stdio.h>
#include<conio.h>
#include "stdlib.h"

#define DIALOGUE 0
#define MAXDIALOGUE 10

unsigned int dialogue;
char key;
unsigned char pch;

void writedialogue(unsigned int d);

void main() {
    clrscr();
    textcolor(RED);

    cprintf("\n\r\n\r\n\r\n\r\n\r\n\r");
    cprintf("          DOS Clone Kernel Process Transferring to Foreground...\n\r");

    while(1) {
	key=getch();

	switch(key) {

	    case 27:
		exit(0);
		break;
	    default:
	    cprintf("%c",key);
	    // cprintf("[%d] ",key);
		continue;
	}
    }
}
