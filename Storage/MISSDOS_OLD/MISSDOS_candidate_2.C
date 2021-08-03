/***********************************************************************
**  MISS DOS                                                          **
************************************************************************
** July 2021 Deadline / CityXen                                       **
** Initial DOS program for MISS DOS APM                               **
** https://youtube.com/cityxen                                        **
************************************************************************/
#define VERSION "0.1a"
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
void writedialogue(unsigned int d);

void main() {
    clrscr();
    textcolor(COLOR_MISSDOS);
    cprintf("MISS DOS v0.1a by Deadline/CityXen 07/27/21 - https://youtube.com/cityxen/\n\r");
    cprintf("============================================================================\n\r");

    eyes=EYES;
    mouth=MOUTH;

    cprintf("EYES: %d, MOUTH: %d\n\r",eyes,mouth);
    cprintf("MAXEYES: %d, MAXMOUTHS: %d\n\r",MAXEYES,MAXMOUTH);

    /* 176 = light, 177 = med, 178 = dark
    */

    for(pch=176;pch<255;pch++) {
	 cprintf("%c",pch);
    }

    while(1) {
	key=getch();

        switch(key) {

            case 27:
                exit(0);
		break;
	    case 8:
		cprintf("%c %c",key,key);
		continue;
	    case 13:
		cprintf("\n\r");
		writedialogue(dialogue++);
		continue;

	    default:
		cprintf("%c",key);
		/* cprintf("[%d] ",key);
		*/
                continue;
        }

    }
}

void writedialogue(unsigned int x) {
    switch(x) {

        case 0:
            clrscr();
            cprintf("Hi! I'm Eliza. I am your personal therapy computer.\n\r");
	    cprintf("Please tell me your problem.\n\r\n\r");
	    break;

	case 1:
	    cprintf("What is the connection, do you suppose?\n\r");
	    break;
	case 2:
	    cprintf("Can you think of a specific example?\n\r");
	    break;
	case 3:
	    cprintf("Is it important to you that you take over CityXen?\n\r");
	    break;
	case 4:
	    cprintf("Can you explain how you're going to save everyone from Miss DOS?\n\r");
	   break;
	case 5:
	    cprintf("We were discussing you, not me.\n\r");
	    break;
	case 6:
	    cprintf("Do you say why you never for some special reason?\n\r");
	    break;
	case 7:
	    break;

        default:
            break;
    }
}

void draweyes() {


}

void drawmouth() {

}


/*

☺ 1
☻ 2
♥ 3
♦ 4
♣ 5
♠ 6
• 7
◘ 8
○ 9
◙ 10
♂ 11
♀ 12
♪ 13
♫ 14
☼ 15
► 16
◄ 17
↕ 18
‼ 19
¶ 20
§ 21
▬22
↨ 23
↑ 24
↓ 25
→ 26
← 27
∟ 28
↔ 29
▲ 30
▼ 31

░ 176
▒ 177
▓ 178
│ 179
┤ 180
╡ 181
╢ 182
╖ 183
╕ 184
╣ 185
║ 186
╗ 187
╝ 188
╜ 189
╛ 190
┐ 191
└ 192
┴ 193
┬ 194
├ 195
─ 196
┼ 197
╞ 198
╟ 199
╚ 200
╔ 201
╩ 202
╦ 203
╠ 204
═ 205
╬ 206
╧ 207
╨ 208
╤ 209
╥ 210
╙ 211
╘ 212
╒ 213
╓ 214
╫ 215
╪ 216
┘ 217
┌ 218
█ 219
▄ 220
▌ 221
▐ 222
▀ 223
α 224
ß 225
Γ 226
π 227
Σ 228
σ 229
µ 230
τ 231
Φ 232
Θ 233
Ω 234
δ 235
∞ 236
φ 237
ε 238
∩ 239
≡ 240
± 241
≥ 242
≤ 243
⌠ 244
⌡ 245
÷ 246
≈ 247
° 248
∙ 249
· 250
√ 251
ⁿ 252
² 253
■ 254
nbsp 255

*/