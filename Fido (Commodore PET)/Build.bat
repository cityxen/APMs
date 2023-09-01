@echo off
echo Build Script: Building %1
call genkickass-script.bat -t PET -o prg_files -m true -s true -l "RETRO_DEV_LIB"
call KickAss.bat Fido.asm

pause