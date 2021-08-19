FROM fithwum/debian-base:buster
MAINTAINER fithwum

# URL's for files
ARG INSTALL_SCRIPT=https://raw.githubusercontent.com/fithwum/teamspeak-debian/master/files/Install_Script.sh

# Install dependencies and folder creation
RUN apt-get -y update && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /clam-temp /infected /logs /scan \
	&& chmod 777 -R /clam-temp /infected /logs /scan \
	&& chown 99:100 -R /clam-temp /infected /logs /scan
ADD "${INSTALL_SCRIPT}" /clam-temp
RUN chmod +x /clam-temp/Install_Script.sh

# directory where data is stored
VOLUME /scan

# Run command
CMD [ "/bin/bash", "./clam-temp/Install_Script.sh" ]
