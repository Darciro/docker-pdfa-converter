FROM php:5.6.30-apache

VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]

RUN echo "[ ***** ***** ***** ] - Copying files to Image ***** ***** ***** "
COPY ./src /tmp/src

RUN echo "deb http://ftp.de.debian.org/debian experimental main" | tee -a /etc/apt/sources.list
RUN echo "deb http://ftp.de.debian.org/debian unstable main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

RUN echo "[ ***** ***** ***** ] - Installing each item in new command to use cache and avoid download again ***** ***** ***** "
RUN apt-get install -y apt-utils
RUN apt-get install -y nodejs
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y ghostscript
RUN apt-get install -y tesseract-ocr
RUN apt-get install -y tesseract-ocr-por
RUN apt-get install -y pdftk
RUN apt-get install -y unpaper
RUN apt-get install -y qpdf
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-cffi
RUN pip3 install ocrmypdf

RUN chmod +x -R /tmp/src/

EXPOSE 80
EXPOSE 9000

WORKDIR /var/www/

RUN echo "[ ***** ***** ***** ] - Begin of Actions inside Image ***** ***** ***** "
CMD /tmp/src/actions/start.sh