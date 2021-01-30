echo "##############################################################################"
echo "Building Apollol"
vasm6502 Apollol.asm -c02 -chklabels -nocase -Fvasm=1 -DBuildAP2=1 -Fbin -o "APOLLOL" # -L listing.txt
if [ $? -eq 0 ]; then
    echo "##############################################################################"
    echo "Build OK, creating APOLLOL.DSK"
    rm APOLLOL.DSK
    cp BLANK.DSK APOLLOL.DSK
    a2in b.0c00 APOLLOL.DSK APOLLOL APOLLOL
    a2ls APOLLOL.DSK
    echo "##############################################################################"
    echo "Running Apple ][e Emulator with APOLLOL.DSK"
    applewin APOLLOL.DSK
else
    echo "Error in asm file"
fi

