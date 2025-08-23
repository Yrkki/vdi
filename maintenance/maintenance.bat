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
winget pin add --id Malwarebytes.Malwarebytes
winget upgrade --include-unknown --all
echo.
powershell -Command refreshenv
winget upgrade --include-unknown
echo.

echo.
echo Finished maintenance script
echo ------------------------------------------------------
@echo ON
