@echo off
echo ===========================
echo IRRISYS Build Script
echo ===========================
echo.
set XC8_PATH=C:\Program Files\Microchip\xc8\v2.46\bin\xc8.exe
set MEPROG_PATH=C:\Program Files (x86)\MELabs Programmer\meProg.exe
echo Compiling...
"%XC8_PATH%" --chip=18F2525 src\main.c src\encoder.c src\menu.c src\eeprom.c -osrc\main -Iinclude
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Compilation FAILED!
    pause
    exit /b 1
)
echo.
echo Compilation successful!
echo.
echo Launching programmer...
"%MEPROG_PATH%" /DPIC"18F2525" "src\main.hex"
pause