#!/bin/bash
httpd () {
#echo "Enter service name"
#read $1
service=$(ps -ef | grep apache | awk 'NR==1 {print $2}')
echo "old PID is" $service
#kill -9 $service
/etc/init.d/apache2 stop >  /dev/null   2>&1 >> /tmp/httpd
echo "stop date" $(date +"%F %R") >> /tmp/httpd
echo "Process is stoping. .. ..."
sleep 3
/etc/init.d/apache2 start >  /dev/null  2>&1 >> /tmp/httpd
echo "start date" `date +"%F %R"` >> /tmp/httpd
echo "process starting. .. ..."
sleep 3

service_new=$(ps -ef | grep apache | awk 'NR==1 {print $2}')
echo "New PID is" $service_new
}


# Invoking function
httpd