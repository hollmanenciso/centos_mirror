FROM centos:6
MAINTAINER Hollman Enciso <hollman.enciso@gmail.com>

#upgrade OS and install the neccesary packages
RUN yum -y update && yum -y install createrepo httpd rsync

#Create path on apache Document Root to publish
RUN mkdir -pv /var/www/html/centos/

#Declare work volume
VOLUME ["/var/www/html/centos/"]

#Download the repos -- you can change your prefered or near repo to download the pachages
/usr/bin/rsync -avrt rsync://mirrors.psychz.net/Centos/ /var/www/html/centos/

RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

#Expose default apache port
EXPOSE 80

#run apache on background
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
