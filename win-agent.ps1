#Download agent's files
wget https://vstsagentpackage.azureedge.net/agent/2.158.0/vsts-agent-win-x64-2.158.0.zip -UseBasicParsing -outfile C:\Users\agentadmin\Downloads\vsts-agent-win-x64-2.158.0.zip

#Unpack files
mkdir C:\agent ; cd C:\agent
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("C:\Users\agentadmin\Downloads\vsts-agent-win-x64-2.158.0.zip", "$PWD")

#Configure agent
.\config.cmd --unattended --url "$1" --auth pat --token "$2" --pool "$3" --agent "$4"  --work ./_work --runAsService 
