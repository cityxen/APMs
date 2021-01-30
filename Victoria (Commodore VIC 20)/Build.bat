@echo off
echo Build Script: Building %1
start /b genkickass-script.bat -t VIC20 -o prg_files -m true -s true -l "RETRO_DEV_LIB"
KickAss.bat %1
