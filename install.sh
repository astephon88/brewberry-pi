#!/bin/bash
if [ "$(id -u)" != "0" ]; then
    echo "Please re-run as root."
    exit 1
fi
apt-get install -y debconf-utils
debconf-set-selections <<< 'mysql-server mysql-server/root_password password beermenu'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password beermenu'
apt-get install -y mysql-server python-mysqldb apache2 libapache2-mod-php5 php5 php5-mysql git
cp -r www/* /var/www/
mkdir -p /opt/brewberrypi
cp flowmeter.py kegomatic.py temp_handler.py /opt/brewberrypi
cp temp_handlerd brewberryd /etc/init.d/
insserv brewberryd
insserv temp_handlerd
git clone https://github.com/timofurrer/w1thermsensor.git && cd w1thermsensor
python setup.py install
#mysql schema setup
mysql -uroot -pbeermenu -e "CREATE DATABASE IF NOT EXISTS beer"
mysql -uroot -pbeermenu beer < schema.sql
service brewberryd start
service temphandlerd start
