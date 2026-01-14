@echo OFF
echo Starting maintenance script
echo ======================================================
echo.
echo.

echo Running System file checker...
echo ------------------------------------------------------
sfc /scannow
echo.

echo Restoring health...
echo ------------------------------------------------------
dism /online /cleanup-image /restorehealth
sfc /scannow
echo.

GOTO EndComment1
@echo OFF
echo Fixing Permission/Ownership Issue...
echo ------------------------------------------------------
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
echo.
@echo ON

@echo OFF
echo Fixing Windows Update Cache Corruption...
echo Action: Clear the Windows Update Cache...
echo ------------------------------------------------------
net stop bits
net stop wuauserv
rd /s /q C:\Windows\SoftwareDistribution
timeout /t 10
net start bits
net start wuauserv
echo.
@echo ON

@echo OFF
echo Identify the Persistently Corrupted File...
echo ------------------------------------------------------
echo Action: Examine the Latest CBS Log
dism /online /cleanup-image /startcomponentcleanup
echo.
echo Action: Action: Identify the Corrupted File.
echo Run SFC Again.
sfc /scannow
echo.
@echo ON
@echo OFF
echo Extract Repair Details
findstr /c:"[SR] Repairing file" C:\Windows\Logs\CBS\CBS.log > "%USERPROFILE%\Desktop\sfcdetails.txt"
echo.
echo Review the Output
notepad.exe "%USERPROFILE%\Desktop\sfcdetails.txt"
echo.
@echo ON
@echo OFF
echo Execute Targeted Fix...
echo ------------------------------------------------------
regsvr32 %SystemRoot%\system32\DafPrintProvider.dll
echo.
@echo ON
@echo OFF
echo Run Aggressive DISM Cleanup...
echo ------------------------------------------------------
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
echo.
@echo ON
@echo OFF
echo Final Verification...
echo ------------------------------------------------------
sfc /scannow
echo.
@echo ON
@echo OFF
echo Extract Repair Details
findstr /c:"[SR] Repairing file" C:\Windows\Logs\CBS\CBS.log > "%USERPROFILE%\Desktop\sfcdetails.txt"
echo.
echo Review the Output
notepad.exe "%USERPROFILE%\Desktop\sfcdetails.txt"
echo.
@echo ON
:EndComment1

echo Running Check disk...
echo ------------------------------------------------------
chkdsk /scan
echo.

echo Running the Chocolatey package manager...
echo ------------------------------------------------------
choco outdated
choco upgrade all
echo.
powershell -Command refreshenv
choco outdated
echo.

@REM powershell -executionpolicy remotesigned -File .\malwarebytes.ps1
echo Running the Windows package manager...
echo ------------------------------------------------------
@REM winget pin add --id Malwarebytes.Malwarebytes
winget upgrade --include-unknown --all
echo.
powershell -Command refreshenv
winget upgrade
echo.

echo.
echo Finished maintenance script
echo ------------------------------------------------------
@echo ON
