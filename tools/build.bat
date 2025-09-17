@echo off
echo ===========================
echo IRRISYS Build Script
echo ===========================
echo.

set XC8_PATH=C:\Program Files\Microchip\xc8\v2.46\bin\xc8.exe
set MEPROG_PATH=C:\Program Files (x86)\MELabs Programmer\meProg.exe
set SOURCE=..\src\main.c
set OUTPUT=..\src\main

echo Compiling...
"%XC8_PATH%" --chip=18F2525 "%SOURCE%" -o"%OUTPUT%" -I..\include

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
"%MEPROG_PATH%" /DPIC"18F2525" "%OUTPUT%.hex"

pause