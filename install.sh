apt-get install mysql-server python-mysqldb apache2 libapache2-mod-php5 php5 php5-mysql git
cp -r www/* /var/www/
mkdir -p /opt/brewberrypi
cp flowmeter.py kegomatic.py temp_handler.py /opt/brewberrypi
cp temp_handlerd brewberryd /etc/init.d/
insserv brewberryd
insserv temp_handlerd
git clone https://github.com/timofurrer/w1thermsensor.git && cd w1thermsensor
python setup.py install
#mysql schema setup
service brewberryd start
service temphandlerd start