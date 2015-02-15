# brewberry-pi
Kegerator Inventory Management

Brewberry-Pi is a system for monitoring and managing a home kegerator housed on a Raspberry Pi. It is intended to monitor keg levels through the use of flow sensors and monitor and manage kegerator tempatures with a temp seonsor and relay. Information about the current state of the kegerator, as well as additional details on the beers on tap, are displayed (and eventually managed) through a web interface. 

The project is currently broken into 4 distinct pieces: the flow meter daemon, the temperature control daemon, the mysql database, and the web interface. The database contains a table to manage the information for each keg, and a table to store the current and set-point temperatures. The flow meter daemon is a python script that montiors each tap for flow events, tracks the amount poured, and subtracts that amount from the assocated entry in the database. The temp handler daemon tracks the current temperature using a dallas 1-wire temp probe, compares the current value to the set point in the database, determines the appropriate relay state based on this comparison, and updates the current temp value in the database. The temperature is controlled using a basic 5 degree hysteresis. The web interface uses php to query and display the state of the database.

Some of the code for the visual elements of the webpage was originally derived from the hymaswoodkegerface project.
The flowmeter code was originally derived from the kegomatic project.

Addtional pre-reqs on a standard Raspbian Wheezy load include apache2, mysql-server, mysql-client python-mysqldb, php5, libapache2-mod-php5, php5-mysql, and the w1thermsensor python library (github.com/timofurrer/w1thermsensor). 

Hardware requirements include (of course) a raspberry pi, a food-safe flow meter (such as those sold by adafruit.com), a dallas 1-wire temperature sensor (again, can be found at adafruit.com), and a solid-state relay for the kegerator compressor switching.

