RESET='\033[0m'
CYAN='\033[0;36m'
APT_KEY='379CE192D401AB61'
BRK="echo -e "${CYAN}---------------------------------------------------------------""
if [ -x "$(command -v speedtest)" ]; then
    ${BRK}
    echo -e "${CYAN}Command speedtest already exists. Please remove it in order to install using this script"
    ${BRK}
    sleep 3
else
    if [ -x "$(command -v apt)" ]
    then
        echo -e "${CYAN}Detected Ubuntu/Debian installation."
        sleep 2
        apt-get install gnupg1 apt-transport-https dirmngr -y > /dev/null
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $APT_KEY 
        echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
        apt update -y
        apt install -y speedtest
        ${BRK}
        echo -e "${CYAN} Speedtest has been installed. Use speedtest as the command to control it."
        ${BRK}
        sleep 3
        speedtest -V
        #-------------------------------------------------
    elif [ -x "$(command -v yum)" ]
    then
        echo -e "${CYAN} Detected CentOS installation."
        sleep 2
        yum install wget -y > /dev/null
        wget https://bintray.com/ookla/rhel/rpm -O bintray-ookla-rhel.repo
        mv bintray-ookla-rhel.repo /etc/yum.repos.d/
        yum install speedtest -y
        ${BRK}
        echo -e "${CYAN} Speedtest has been installed. Use speedtest as the command to control it."
        ${BRK}
        sleep 3
        speedtest -V
        #-------------------------------------------------
    elif [ -x "$(command -v brew)" ]
    then
        echo -e "${CYAN} Detected MacOS installation."
        sleep 2
        brew tap teamookla/speedtest 
        brew update 
        brew install speedtest --force 
        ${BRK}
        echo -e "${CYAN} Speedtest has been installed. Use speedtest as the command to control it."
        ${BRK}
        sleep 3
        speedtest -V
        #-------------------------------------------------
    elif [ -x "$(command -v pkg)" ]
    then
        echo -e "${CYAN} Detected FreeBSD installation."
        sleep 2
        pkg update && pkg install -g -y libidn2 ca_root_nss
        pkg add "https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-freebsd.pkg"
        ${BRK}
        echo -e "${CYAN} Speedtest has been installed. Use speedtest as the command to control it."
        ${BRK}
        sleep 3
        speedtest -V
        #-------------------------------------------------
    else
        echo -e "${CYAN} Non-compatible installation detected. Yum/pkg/apt were not found in path."
    fi
fi
echo -e "${RESET} "
