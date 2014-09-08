FROM deliverous/jessie
RUN echo "deb http://ftp.fr.debian.org/debian/ sid main non-free contrib" >  /etc/apt/sources.list
RUN apt-get update && apt-get dist-upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y dpkg-dev && apt-get clean
ADD california /usr/src/california
RUN apt-get update && apt-get install -y $(cat /usr/src/california/debian/control | sed -e ':a;N;$!ba;s/,\s*\n/ /g' | grep Build-Depends | sed -e 's/([^(]*)//g' -e 's/Build-Depends://') && apt-get clean
RUN cd /usr/src/california && dpkg-buildpackage
CMD "cd /usr/src && tar -c *.deb"
