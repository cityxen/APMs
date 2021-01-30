@echo off
echo Build Script: Building %1
start /b genkickass-script.bat -t PET -o prg_files -m true -s true -l "RETRO_DEV_LIB"
KickAss.bat Fido.asm