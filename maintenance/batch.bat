@echo OFF
echo Starting maintenance batch script
echo ---------------------------------
echo .
echo .

schtasks /run /tn \Jorich\Maintenance\Maintenance & schtasks /run /tn \Jorich\Maintenance\Monitor

echo .
echo .
echo Finished maintenance batch script
echo ---------------------------------
@echo ON
