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
#winget "$verb" --verbose -e --id Dropbox.Dropbox
winget "$verb" --verbose -e --id Google.Drive
winget "$verb" --verbose -e --id Iterate.Cyberduck
winget "$verb" --verbose -e --id 7zip.7zip
winget "$verb" --verbose -e --name "Hard Disk Sentinel Professional"
winget "$verb" --verbose -e --id MiniTool.PartitionWizard.Free
winget "$verb" --verbose -e --id AOMEI.Backupper
winget "$verb" --verbose -e --id AOMEI.PartitionAssistant
echo

echo === Installing Networking... ====================================================================
winget "$verb" --verbose -e --id Insecure.Nmap
winget "$verb" --verbose -e --id angryziber.AngryIPScanner
echo

echo === Compute... ====================================================================
winget "$verb" --verbose -e --id UCBerkeley.BOINC
echo

echo === Installing OS... ====================================================================
winget "$verb" --verbose -e --name "Alpine WSL"
winget "$verb" --verbose -e --id Canonical.Ubuntu.2204
winget "$verb" --verbose -e --id kalilinux.kalilinux
echo

echo === Installing Platform... ====================================================================
winget "$verb" --verbose -e --id OpenJS.NodeJS.LTS
# winget upgrade -e --id Heroku.HerokuCLI --include-unknown
winget "$verb" --verbose -e --id Heroku.HerokuCLI
winget "$verb" --verbose -e --id Hashicorp.Terraform
#winget "$verb" --verbose -e --id python
winget "$verb" --verbose -e --id Docker.DockerDesktop
#winget "$verb" --verbose -e --id docker-cli
#winget "$verb" --verbose -e --id docker-machine
#winget "$verb" --verbose -e --id cmake.install
##winget "$verb" --verbose -e --id cmake
#winget "$verb" --verbose -e --id awssamcli
#winget "$verb" --verbose -e --id vcredist2010
#winget "$verb" --verbose -e --id imagemagick
winget "$verb" --verbose -e --id ImageMagick.ImageMagick
winget "$verb" --verbose -e --id OliverBetz.ExifTool
#winget "$verb" --verbose -e --id prometheus
echo

echo === Installing Browser... ====================================================================
winget "$verb" --verbose -e --id Google.Chrome
winget "$verb" --verbose -e --id Adobe.Acrobat.Reader.64-bit
#winget "$verb" --verbose -e --id firefox
echo

echo === Installing Dev Tools... ====================================================================
winget "$verb" --verbose -e --id Microsoft.WindowsTerminal.Preview
winget "$verb" --verbose -e --id Git.Git
winget "$verb" --verbose -e --id GitHub.GitHubDesktop
winget "$verb" --verbose -e --id Microsoft.PowerShell.Preview
winget "$verb" --verbose -e --id Microsoft.VisualStudioCode.Insiders
winget "$verb" --verbose -e --id Microsoft.VisualStudioCode
echo

echo === Installing Provisioning Tools... ====================================================================
winget "$verb" --verbose -e --id Hashicorp.Terraform
echo

echo === Installing R... ====================================================================
winget "$verb" --verbose -e --id RProject.R
winget "$verb" --verbose -e --id RProject.Rtools
winget "$verb" --verbose -e --id Posit.RStudio
echo

echo === Installing Productivity... ====================================================================
winget "$verb" --verbose -e --id Microsoft.Sysinternals.ProcessExplorer
#winget "$verb" --verbose -e --id dotnetcore
winget "$verb" --verbose -e --id Microsoft.PowerToys
#winget "$verb" --verbose -e --id diffmerge
winget "$verb" --verbose -e --id WinMerge.WinMerge
winget "$verb" --verbose -e --id PuTTY.PuTTY
winget "$verb" --verbose -e --id CPUID.CPU-Z
winget "$verb" --verbose -e --id TechPowerUp.GPU-Z
echo

echo === Installing Viewer... ====================================================================
winget "$verb" --verbose -e --name IrfanView64
# winget "$verb" --verbose -e --id IrfanSkiljan.IrfanView
# #winget "$verb" --verbose -e --id irfanview-shellextension
# #winget "$verb" --verbose -e --id irfanviewplugins
echo

echo === Graphics... ====================================================================
winget "$verb" --verbose -e --id GIMP.GIMP
winget "$verb" --verbose -e --id BlenderFoundation.Blender
echo

echo === AWS... ====================================================================
winget "$verb" --verbose -e --id Amazon.AWSCLI
winget "$verb" --verbose -e --id Amazon.SAM-CLI
winget "$verb" --verbose -e --id Amazon.SessionManagerPlugin
winget "$verb" --verbose -e --id Amazon.AWSVPNClient
winget "$verb" --verbose -e --id ChefSoftware.Workstation
winget "$verb" --verbose -e --id Serverless.Serverless
echo

echo === Hardware Tools... ====================================================================
winget "$verb" --verbose -e --id ALCPU.CoreTemp
echo

echo === Installing Dell Drivers... ====================================================================
winget "$verb" --verbose -e --id Dell.CommandUpdate.Universal
winget "$verb" --verbose -e --id Dell.CommandConfigure
winget "$verb" --verbose -e --id Dell.DisplayManager
winget "$verb" --verbose -e --name "Dell Digital Delivery"
winget "$verb" --verbose -e --name "My Dell"
winget "$verb" --verbose -e --name "Media Suite Essentials for Dell"
echo

echo === Installing Intel Drivers... ====================================================================
winget "$verb" --verbose -e --id Intel.IntelDriverAndSupportAssistant
winget "$verb" --verbose -e --id Solidigm.StorageTool
echo

echo === Installing Logitech Drivers... ====================================================================
winget "$verb" --verbose -e --id Logitech.SetPoint
winget "$verb" --verbose -e --id Logitech.LGS
# winget "$verb" --verbose -e --id Logitech.GHUB
# winget "$verb" --verbose -e --id Logitech.LogiTune
# winget "$verb" --verbose -e --id Logitech.CameraSettings
echo

echo === Benchmarking... ====================================================================
winget "$verb" --verbose -e --id FinalWire.AIDA64.Extreme
echo

echo === Personalization... ====================================================================
# winget "$verb" --verbose -e --id 9PF4KZ2VN4W9  # TranslucentTB
echo

echo === Office... ====================================================================
winget "$verb" --verbose -e --id Adobe.Acrobat.Reader.64-bit
echo

echo === Media... ====================================================================
winget "$verb" --verbose -e --id Spotify.Spotify
winget "$verb" --verbose -e --id Daum.PotPlayer
winget "$verb" --verbose -e --id OBSProject.OBSStudio
echo

echo === Conferencing... ====================================================================
# winget "$verb" --verbose -e --id Cisco.CiscoWebexMeetings
# winget "$verb" --verbose -e --id SlackTechnologies.Slack
echo

echo === Security... ====================================================================
# winget "$verb" --verbose -e --id Malwarebytes.Malwarebytes
# winget "$verb" --verbose -e --id Microsoft.Sysinternals.Autoruns
winget "$verb" --verbose -e --id Microsoft.Sysinternals.Suite
echo

echo === Miscellaneous Tools... ====================================================================
# winget "$verb" --verbose -e --id ...
echo

echo === Upgrade all... ====================================================================
echo Upgrade all...
winget upgrade --include-unknown --all
echo

# echo === Refreshing OS Environment... ====================================================================
# # refreshenv
# echo

echo === Installing NPM Packages... ====================================================================
npm install -g @angular/cli
npm install -g npm-run-all
npm install -g figlet
# npm install -g figlet-cli^1.0.0 --force
# npm install -g semantic-release-cli
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
