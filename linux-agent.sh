!/bin/bash
echo "start"
cd /home/agentadmin
mkdir agent
cd agent
echo "Downloading..."
wget -O https://vstsagentpackage.azureedge.net/agent/2.158.0/vsts-agent-linux-x64-2.158.0.tar.gz agent.tar.gz 
tar zxvf agent.tar.gz
chmod -R 777 .
echo "Extracted"
./bin/installdependencies.sh
echo "Dependencies installed"
sudo -u agentadmin ./config.sh --unattended --url $1 --auth pat --token $2 --pool $3 --agent $4 --acceptTeeEula --work ./_work --runAsService
echo "Configuration done"
./svc.sh install
echo "Service installed"
./svc.sh start
echo "Service started"
echo "Config done"
exit 0
