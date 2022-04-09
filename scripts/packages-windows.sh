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
# Set-ExecutionPolicy Bypass -Scope Process -Force
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
# iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco --version

echo Installing Storage...
choco install dropbox -y
choco install google-drive-file-stream -y
choco install cyberduck -y

echo Installing Browser...
choco install googlechrome -y
choco install firefox -y

echo Installing Platform...
choco install nodejs-lts -y
#choco install nodejs.install -y
choco install heroku-cli -y
choco install terraform -y
choco install python -y
choco install docker-cli -y
choco install docker-machine -y
choco install cmake.install -y
#choco install cmake -y
choco install awssamcli -y
choco install vcredist2010 -y
#choco install imagemagick -y
choco install imagemagick.app -y
choco install prometheus -y

echo Installing Storage...
choco install git -y
choco install github-desktop -y
#choco install vscode-insiders -y
choco install vscode-insiders.install -y
#choco install vscode -y

echo Installing R...
choco install r -y
choco install r.studio -y

echo Installing Productivity...
choco install dotnetcore -y
choco install powertoys -y
choco install diffmerge -y
choco install putty.install -y
choco install cpu-z.install -y
choco install gpu-z -y

echo Installing Viewer...
choco install irfanview -y
choco install irfanview-shellextension -y
choco install irfanviewplugins -y

echo Installing NPM Packages...
echo ----------------------------------
npm install -g @angular/cli
npm install -g npm-run-all
npm install -g figlet

echo Clone repos...
echo ----------------------------------
repos=~/source/repos
mkdir -p $repos
cd $repos
#curl "https://api.github.com/users/Yrkki/repos" | grep -e 'clone_url*' | cut -d \" -f 4 | xargs -L1 echo
curl "https://api.github.com/users/Yrkki/repos" | grep -e 'clone_url*' | cut -d \" -f 4 | xargs -L1 git clone

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
# echo -n $'\\033[0;32m''NPM package:'$'\\033[0m' ; npm v
