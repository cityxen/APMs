vasm6502 Apollol.asm -c02 -chklabels -nocase -Fvasm=1 -DBuildAP2=1 -Fbin -o "APOLLOL.BIN" # -L listing.txt
retval=$?
echo $retval
if [ $retval -eq 0 ]
then
    rm APOLLOL.DSK
    cp BLANK.DSK APOLLOL.DSK
    a2in b.0c00 APOLLOL.DSK APOLLOL.BIN APOLLOL.BIN
    a2ls APOLLOL.DSK
    AppleWin -d1 APOLLOL.DSK

else
    echo "Error in asm file"
fi
