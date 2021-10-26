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

#define VERSION "0.1.2a"
#define DDATE "08/06/2021"
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<time.h>

#define COLOR_MISSDOS RED
#define COLOR_CLONE   GREEN

#define MATRIX 30
#define COLOR_MTR1    RED
#define COLOR_MTR2    LIGHTRED
#define COLOR_MTR3    RED
#define MTR_TIME 1000

void drawface(unsigned int e);
void initmatrix(void);
void updatematrix(void);

char key;
unsigned char face;
unsigned char pch;

unsigned int matrixtimer;
char mtrx[MATRIX]; // for the matrixy stuff
char mtry[MATRIX];
char mtr2x[MATRIX];
char mtr2y[MATRIX];
char mtr3x[MATRIX];
char mtr3y[MATRIX];
char mtr4x[MATRIX];
char mtr4y[MATRIX];

void main() {
    randomize();
    clrscr();
    textcolor(COLOR_MISSDOS);
    cprintf("===============================================================================\n\r");
    cprintf("MISS DOS v%s by Deadline/CityXen %s - https://youtube.com/cityxen/\n\r",VERSION,DDATE);
    textcolor(COLOR_CLONE);
    cprintf("DOS Clone Version\n\r");
    textcolor(COLOR_MISSDOS);
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

    initmatrix();

    while(1) {

	while(!kbhit()) {

	    matrixtimer+=1;
	    if(matrixtimer>MTR_TIME) {
		matrixtimer=0;
		drawface(face);
		updatematrix();
	    }
	}

	key=getch();

	switch(key) {

	    case 27:
		exit(0);
		break;
	    case 8:
		break;
	    case 13:
		break;

	    case '1':
		face=1;
		drawface(1);
		break;

	    case '2':
		face=2;
		drawface(2);
		break;

	    case '3':
		face=3;
		drawface(3);
		break;

	    case '4':
		face=4;
		drawface(4);
		break;

	    case 'm':
		face=5;
		drawface(5);
		break;

	    default:
		// cprintf("%c",key);
		// cprintf("[%d] ",key);
		break;
	}
    }
}

void drawface(unsigned int e) {

    gotoxy(1,18);

    switch(e){

	case 1:
	    system("type gfx1.diz");
	    break;

	case 2:
	    system("type gfx2.diz");
	    break;

	case 3:
	    system("type gfx3.diz");
	    break;

	case 4:
	    system("type gfx4.diz");
	    break;

	case 5:
	    system("type bsod.diz");
	    break;

	default:
	    break;


    }

}

void initmatrix() {
   // initialize the matrixy stuff
   matrixtimer=0;
    for(int i=0;i<MATRIX;i++) {
	mtrx[i]=rand()%79;
	mtr2x[i]=mtrx[i];
	mtr3x[i]=mtrx[i];
	mtr4x[i]=mtrx[i];

	mtry[i]=rand()%20;
	mtr2y[i]=mtry[i]-1;
	mtr3y[i]=mtry[i]-2;
	mtr4y[i]=mtry[i]-3;

    }

}

void updatematrix() {

   for(int i=0;i<MATRIX;i++) {

	mtr4x[i]=mtr3x[i];
	mtr3x[i]=mtr2x[i];
	mtr2x[i]=mtrx[i];

	mtr4y[i]=mtr3y[i];
	mtr3y[i]=mtr2y[i];
	mtr2y[i]=mtry[i];


	mtrx[i]=mtrx[i]+((rand()%3)-1); // rand()%79;


	mtry[i]=mtry[i]+1;//rand()%20;
	if(mtry[i]>24) {
	   mtry[i]=0;
	   mtrx[i]=rand()%79;
	}


	gotoxy(mtrx[i],mtry[i]);
	textcolor(COLOR_MTR1);
	cprintf("%c",178);

	gotoxy(mtr2x[i],mtr2y[i]);
	textcolor(COLOR_MTR2);
	cprintf("%c",177);

	gotoxy(mtr3x[i],mtr3y[i]);
	textcolor(COLOR_MTR3);
	cprintf("%c",176);

	gotoxy(mtr4x[i],mtr4y[i]);
	cprintf(" ");


    }

}

