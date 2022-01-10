#!/bin/bash
echo Setting up OS and Applications...
echo ==================================

echo Applying OS Settings...
echo ----------------------------------
#echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionHeight /t REG_SZ /d -225
#echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionWidth /t REG_SZ /d -225
#echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionHeight /t REG_SZ /d -225
#echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionWidth /t REG_SZ /d -225
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v CaptionHeight //t REG_SZ //d -225 //f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v CaptionWidth //t REG_SZ //d -225 //f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v SmCaptionHeight //t REG_SZ //d -225 //f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v SmCaptionWidth //t REG_SZ //d -225 //f

echo Installing Chocolatey Packages...
echo ----------------------------------
echo Installing Chocolatey...
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco --version

echo Installing Storage...
choco install dropbox --version 139.4.4896 -y
choco install google-drive-file-stream --version 54.0.2.0 -y
choco install cyberduck --version 8.2.0.36680 -y

echo Installing Browser...
choco install googlechrome --version 97.0.4692.71 -y
choco install firefox --version 95.0.2 -y

echo Installing Platform...
choco install nodejs-lts --version 16.13.1 -y
#choco install nodejs.install --version 17.3.0 -y
choco install heroku-cli --version 7.53.0.0 -y
choco install terraform --version 1.1.2 -y
choco install python --version 3.10.1 -y
choco install docker-cli --version 19.03.12 -y
choco install docker-machine --version 0.16.2 -y
choco install cmake.install --version 3.22.1 -y
#choco install cmake --version 3.22.1 -y
choco install awssamcli --version 1.36.0 -y
#choco install imagemagick --version 7.1.0.19 -y
choco install imagemagick.app --version 7.1.0.19 -y
choco install prometheus --version 2.2.1 -y

echo Installing Storage...
choco install git --version 2.34.1 -y
choco install github-desktop --version 2.9.6 -y
#choco install vscode-insiders --version 1.64.0.20220107 -y
choco install vscode-insiders.install --version 1.64.0.20220107 -y
#choco install vscode --version 1.63.2 -y

echo Installing R...
choco install r --version 4.1.2 -y
choco install r.studio --version 2021.09.1 -y

echo Installing Productivity...
choco install powertoys --version 0.53.1 -y
choco install diffmerge --version 4.2.0.20170602 -y
choco install putty.install --version 0.76 -y

echo Installing Viewer...
choco install irfanview --version 4.59 -y
choco install irfanview-shellextension --version 1.06 -y
choco install irfanviewplugins --version 4.59 -y

echo Installing NPM Packages...
echo ----------------------------------
npm install -g @angular/cli
npm install -g npm-run-all
npm install -g figlet

echo Clone repos...
echo ----------------------------------
#curl "https://api.github.com/users/Yrkki/repos" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 echo
curl "https://api.github.com/users/Yrkki/repos" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone

echo Reporting...
echo ----------------------------------
choco --version
#echo $'\\033[0;32m''Angular Version:'$'\\033[0m' ; ng version
echo $'\\033[0;32m''OS Version:'$'\\033[0m' ; cat /etc/os-release 2>/dev/null ; lsb_release -a 2>/dev/null ; hostnamectl 2>/dev/null ; uname -r 2>/dev/null ; systeminfo | grep \"OS Name\" 2>/dev/null ; systeminfo | grep \"OS Version\" 2>/dev/null
echo -n $'\\033[0;32m''Node: '$'\\033[0m' ; node -v
echo -n $'\\033[0;32m''NVM: '$'\\033[0m' ; nvm v
echo -n $'\\033[0;32m''Git: '$'\\033[0m' ; git --version
echo -n $'\\033[0;32m''Heroku: '$'\\033[0m' ; heroku --version

echo -n $'\\033[0;32m''NPM: '$'\\033[0m' ; npm -v
echo -n $'\\033[0;32m''NPM verbose:'$'\\033[0m' ; npm version
echo -n $'\\033[0;32m''NPM package:'$'\\033[0m' ; npm v
