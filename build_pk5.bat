@echo off
echo ===================================
echo IRRISYS Main Board Build Script
echo PIC18F26K22 @ 32MHz (Ver_B_Rev_2)
echo XC8 v3.00 - programmed via PICkit 5
echo ===================================
echo.

set XC8_PATH=C:\Program Files\Microchip\xc8\v3.00\bin\xc8-cc.exe
set IPECMD=C:\Program Files\Microchip\MPLABX\v6.30\mplab_platform\mplab_ipe\ipecmd.exe

echo Compiling main board firmware...
echo.

"%XC8_PATH%" -mcpu=18F26K22 ^
    src\main.c ^
    src\encoder.c ^
    src\menu.c ^
    src\eeprom.c ^
    src\lcd.c ^
    src\i2c.c ^
    src\rtc.c ^
    -o src\main.hex ^
    -I include

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo *** Compilation FAILED! ***
    pause
    exit /b 1
)

echo.
echo ===================================
echo Compilation successful!
echo Output: src\main.hex
echo ===================================
echo.

REM MPLAB IPE and ipecmd cannot both own the PICkit, so close the GUI.
REM Unconditional - taskkill is harmless if IPE is not running.
echo Closing MPLAB IPE if open (it would hold the PICkit)...
taskkill /F /IM mplab_ipe64.exe >nul 2>&1
timeout /t 3 /nobreak >nul

echo Programming via PICkit 5...
echo.
REM -M program  -OL release from reset so it runs  (no -W: board is self-powered)
"%IPECMD%" -P18F26K22 -TPPK5 -F"src\main.hex" -M -OL

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo *** PROGRAMMING FAILED! ***
    pause
    exit /b 1
)

echo.
echo ===================================
echo Programming complete.
echo ===================================
pause
