#!/bin/bash
echo Setting up OS and Applications...
echo ====================================================================
echo

echo === Configure parameters... ====================================================================
repos=~/source/repos
verb=search
#verb=install
echo

# echo === Applying OS Settings... ====================================================================
# #echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionHeight /t REG_SZ /d -225
# #echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v CaptionWidth /t REG_SZ /d -225
# #echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionHeight /t REG_SZ /d -225
# #echo y | reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v SmCaptionWidth /t REG_SZ /d -225
# reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v CaptionHeight //t REG_SZ //d -225 //f
# reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v CaptionWidth //t REG_SZ //d -225 //f
# reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v SmCaptionHeight //t REG_SZ //d -225 //f
# reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" //v SmCaptionWidth //t REG_SZ //d -225 //f
# echo

# echo === Installing Package Manager... ====================================================================
# # Set-ExecutionPolicy Bypass -Scope Process -Force
# # [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
# # iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# winget --version
# winget upgrade winget
# winget --version
# echo

echo === Installing Storage... ====================================================================
#winget "$verb" -e --id Dropbox.Dropbox
winget "$verb" -e --id Google.Drive
winget "$verb" -e --id Iterate.Cyberduck
echo

echo === Installing Browser... ====================================================================
winget "$verb" -e --id Google.Chrome
#winget "$verb" -e --id firefox
echo

echo === Installing Platform... ====================================================================
winget "$verb" -e --id OpenJS.NodeJS.LTS
winget "$verb" -e --id Heroku.HerokuCLI
winget "$verb" -e --id Hashicorp.Terraform
#winget "$verb" -e --id python
winget "$verb" -e --id Docker.DockerDesktop
#winget "$verb" -e --id docker-cli
#winget "$verb" -e --id docker-machine
#winget "$verb" -e --id cmake.install
##winget "$verb" -e --id cmake
#winget "$verb" -e --id awssamcli
#winget "$verb" -e --id vcredist2010
#winget "$verb" -e --id imagemagick
winget "$verb" -e --id ImageMagick.ImageMagick
#winget "$verb" -e --id prometheus
echo

echo === Installing Dev Tools... ====================================================================
#winget "$verb" -e --id Git.Git
winget "$verb" -e --id GitHub.GitHubDesktop
#winget "$verb" -e --id vscode-insiders
winget "$verb" -e --id Microsoft.VisualStudioCode.Insiders
winget "$verb" -e --id Microsoft.VisualStudioCode
echo

echo === Installing R... ====================================================================
winget "$verb" -e --id RProject.R
winget "$verb" -e --id Posit.RStudio
echo

echo === Installing Productivity... ====================================================================
winget "$verb" -e --id Microsoft.Sysinternals.ProcessExplorer
#winget "$verb" -e --id dotnetcore
winget "$verb" -e --id Microsoft.PowerToys
#winget "$verb" -e --id diffmerge
winget "$verb" -e --id WinMerge.WinMerge
winget "$verb" -e --id PuTTY.PuTTY
winget "$verb" -e --id CPUID.CPU-Z
winget "$verb" -e --id TechPowerUp.GPU-Z
echo

echo === Installing Viewer... ====================================================================
winget "$verb" -e --id IrfanSkiljan.IrfanView
#winget "$verb" -e --id irfanview-shellextension
#winget "$verb" -e --id irfanviewplugins
echo

echo === Graphics... ====================================================================
winget "$verb" -e --id GIMP.GIMP
echo

echo === Hardware Tools... ====================================================================
winget "$verb" -e --id Logitech.SetPoint
winget "$verb" -e --id Logitech.LGS
# winget "$verb" -e --id Logitech.GHUB
# winget "$verb" -e --id Logitech.LogiTune
# winget "$verb" -e --id Logitech.CameraSettings
winget "$verb" -e --id ALCPU.CoreTemp
echo

echo === Miscellaneous Tools... ====================================================================
# winget "$verb" -e --id 
echo

echo === Upgrade all... ====================================================================
echo Upgrade all...
winget upgrade --all
echo

# echo === Refreshing OS Environment... ====================================================================
# # refreshenv
# echo

echo === Installing NPM Packages... ====================================================================
npm install -g @angular/cli
npm install -g npm-run-all
npm install -g figlet
npm install -g nodemon
echo

# echo === Clone repos... ====================================================================
# # # mkdir -p $repos
# # cd $repos
# # #curl "https://api.github.com/users/Yrkki/repos" | grep -e 'clone_url*' | cut -d \" -f 4 | xargs -L1 echo
# # curl "https://api.github.com/users/Yrkki/repos" | grep -e 'clone_url*' | cut -d \" -f 4 | xargs -L1 git clone
# # echo
#
# . ./clone-repos.sh

echo === Reporting... ====================================================================
winget --version
#echo $'\\033[0;32m''Angular Version:'$'\\033[0m' ; ng version
echo $'\\033[0;32m''OS Version:'$'\\033[0m' ; cat /etc/os-release 2>/dev/null ; lsb_release -a 2>/dev/null ; hostnamectl 2>/dev/null ; uname -r 2>/dev/null ; systeminfo | grep \"OS Name\" 2>/dev/null ; systeminfo | grep \"OS Version\" 2>/dev/null
echo -n $'\\033[0;32m''Node: '$'\\033[0m' ; node -v
echo -n $'\\033[0;32m''NVM: '$'\\033[0m' ; nvm v
echo -n $'\\033[0;32m''Git: '$'\\033[0m' ; git --version
echo -n $'\\033[0;32m''Heroku: '$'\\033[0m' ; heroku --version
echo
echo -n $'\\033[0;32m''NPM: '$'\\033[0m' ; npm -v
echo -n $'\\033[0;32m''NPM verbose:'$'\\033[0m' ; npm version
# echo -n $'\\033[0;32m''NPM package:'$'\\033[0m' ; npm v
echo
