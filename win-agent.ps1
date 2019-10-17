#Download agent's files
wget https://vstsagentpackage.azureedge.net/agent/2.158.0/vsts-agent-win-x64-2.158.0.zip -UseBasicParsing -outfile $HOME\Downloads\vsts-agent-win-x64-2.158.0.zip

#Unpack files
mkdir C:\agent ; cd C:\agent
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.158.0.zip", "$PWD")

#Configure agent
.\config.cmd
