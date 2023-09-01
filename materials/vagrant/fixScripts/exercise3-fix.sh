#!/bin/bash
#add fix to exercise3 here
sudo sed -i '0,/denied/s//granted/' /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart
