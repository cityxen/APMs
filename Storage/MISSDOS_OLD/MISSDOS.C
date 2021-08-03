#include <conio.h>
#include <process.h>
#include <dos.h>
#include <stdio.h>

main(){
    unsigned char ch;
    clrscr();
    printf("\n\n\n\n");

    for(ch = 0; ch < 255; ch++)
    {
    	printf("%c",ch);
    }

    printf("hello");
}

