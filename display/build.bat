@echo off
echo ===================================
echo IRRISYS Display Board Build Script
echo PIC18F14K22 @ 8MHz
echo ===================================
echo.

set XC8_PATH=C:\Program Files\Microchip\xc8\v3.00\bin\xc8-cc.exe
set MEPROG_PATH=C:\Program Files (x86)\MELabs Programmer\meProg.exe

echo Compiling display board firmware...
echo.

"%XC8_PATH%" -mcpu=18F14K22 ^
    src\main.c ^
    src\lcd.c ^
    src\led.c ^
    src\uart.c ^
    src\protocol.c ^
    -o src\display.hex ^
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
echo Output: src\display.hex
echo ===================================
echo.

set /p PROGRAM="Program device? (Y/N): "
if /i "%PROGRAM%"=="Y" (
    echo.
    echo Launching MELabs programmer...
    echo.
    "%MEPROG_PATH%" /DPIC"18F14K22" "src\display.hex"
)

pause
