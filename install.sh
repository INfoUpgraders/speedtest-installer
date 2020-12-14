sudo apt-get install -y gnupg1 apt-transport-https dirmngr

export INSTALL_KEY=379CE192D401AB61

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY

echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list

sudo apt-get -y update

sudo apt-get install -y speedtest

echo "Speedtest installed. You can now run 'speedtest' to run a speedtest on your system."
