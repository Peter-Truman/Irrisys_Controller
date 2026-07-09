@echo off
echo ===================================
echo IRRISYS Main Board Build Script
echo PIC18F26K22 @ 32MHz
echo ===================================
echo.

set XC8_PATH=C:\Program Files\Microchip\xc8\v3.00\bin\xc8-cc.exe
set MEPROG_PATH=C:\Program Files (x86)\MELabs Programmer\meProg.exe

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
    src\ad7994.c ^
    src\pca9535.c ^
    src\eventlog.c ^
    -o src\main.hex ^
    -Iinclude

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

set /p PROGRAM="Program device? (Y/N): "
if /i "%PROGRAM%"=="Y" (
    echo.
    echo Launching MELabs programmer...
    echo.
    "%MEPROG_PATH%" /DPIC"18F26K22" "src\main.hex"
)

pause
