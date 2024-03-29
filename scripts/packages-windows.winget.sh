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

echo === Installing Package Manager\(s\)... ====================================================================
# Set-ExecutionPolicy Bypass -Scope Process -Force
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
# iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco --version
choco upgrade chocolatey --allow-downgrade
choco --version
echo

echo === Configure Package Manager(s)... ====================================================================
choco feature enable -n allowGlobalConfirmation
echo

echo === Installing Storage... ====================================================================
#winget "$verb" -e --id Dropbox.Dropbox
winget "$verb" -e --id Google.Drive
winget "$verb" -e --id Iterate.Cyberduck
winget "$verb" -e --id 7zip.7zip
winget "$verb" -e --name "Hard Disk Sentinel Professional"
winget "$verb" -e --id MiniTool.PartitionWizard.Free
winget "$verb" -e --id AOMEI.Backupper
winget "$verb" -e --id AOMEI.PartitionAssistant
echo

echo === Installing Networking... ====================================================================
winget "$verb" -e --id Insecure.Nmap
winget "$verb" -e --id angryziber.AngryIPScanner
echo

echo === Compute... ====================================================================
winget "$verb" -e --id UCBerkeley.BOINC
echo

echo === Installing OS... ====================================================================
winget "$verb" -e --name "Alpine WSL"
winget "$verb" -e --id Canonical.Ubuntu.2204
winget "$verb" -e --id kalilinux.kalilinux
echo

echo === Installing Platform... ====================================================================
winget "$verb" -e --id OpenJS.NodeJS.LTS
# winget upgrade -e --id Heroku.HerokuCLI --include-unknown
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
winget "$verb" -e --id OliverBetz.ExifTool
#winget "$verb" -e --id prometheus
echo

echo === Installing Browser... ====================================================================
winget "$verb" -e --id Google.Chrome
winget "$verb" -e --id Adobe.Acrobat.Reader.64-bit
#winget "$verb" -e --id firefox
echo

echo === Installing Dev Tools... ====================================================================
winget "$verb" -e --id Microsoft.WindowsTerminal.Preview
winget "$verb" -e --id Git.Git
winget "$verb" -e --id GitHub.GitHubDesktop
winget "$verb" -e --id Microsoft.PowerShell.Preview
winget "$verb" -e --id Microsoft.VisualStudioCode.Insiders
winget "$verb" -e --id Microsoft.VisualStudioCode
echo

echo === Installing Provisioning Tools... ====================================================================
winget "$verb" -e --id Hashicorp.Terraform
echo

echo === Installing R... ====================================================================
winget "$verb" -e --id RProject.R
winget "$verb" -e --id RProject.Rtools
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
winget "$verb" -e --id BlenderFoundation.Blender
echo

echo === AWS... ====================================================================
winget "$verb" -e --id Amazon.AWSCLI
winget "$verb" -e --id Amazon.SAM-CLI
winget "$verb" -e --id Amazon.SessionManagerPlugin
winget "$verb" -e --id Amazon.AWSVPNClient
winget "$verb" -e --id ChefSoftware.Workstation
winget "$verb" -e --id Serverless.Serverless
echo

echo === Hardware Tools... ====================================================================
winget "$verb" -e --id ALCPU.CoreTemp
echo

echo === Installing Dell Drivers... ====================================================================
winget "$verb" -e --id Dell.CommandUpdate.Universal
winget "$verb" -e --id Dell.CommandConfigure
winget "$verb" -e --id Dell.DisplayManager
winget "$verb" -e --name "Dell Digital Delivery"
winget "$verb" -e --name "My Dell"
winget "$verb" -e --name "Media Suite Essentials for Dell"
echo

echo === Installing Intel Drivers... ====================================================================
winget "$verb" -e --id Intel.IntelDriverAndSupportAssistant
winget "$verb" -e --id Solidigm.StorageTool
echo

echo === Installing Logitech Drivers... ====================================================================
winget "$verb" -e --id Logitech.SetPoint
winget "$verb" -e --id Logitech.LGS
# winget "$verb" -e --id Logitech.GHUB
# winget "$verb" -e --id Logitech.LogiTune
# winget "$verb" -e --id Logitech.CameraSettings
echo

echo === Benchmarking... ====================================================================
winget "$verb" -e --id FinalWire.AIDA64.Extreme
echo

echo === Personalization... ====================================================================
# winget "$verb" -e --id 9PF4KZ2VN4W9  # TranslucentTB
echo

echo === Office... ====================================================================
winget "$verb" -e --id Adobe.Acrobat.Reader.64-bit
echo

echo === Media... ====================================================================
winget "$verb" -e --id Spotify.Spotify
winget "$verb" -e --id Daum.PotPlayer
winget "$verb" -e --id OBSProject.OBSStudio
echo

echo === Conferencing... ====================================================================
winget "$verb" -e --id Cisco.CiscoWebexMeetings
winget "$verb" -e --id SlackTechnologies.Slack
echo

echo === Security... ====================================================================
winget "$verb" -e --id Malwarebytes.Malwarebytes
winget "$verb" -e --id Microsoft.Sysinternals.Autoruns
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
