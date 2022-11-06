# Start from a Debian Jessie 8.7
FROM debian:jessie
MAINTAINER ADITYA KUMAR <adikid1996@gmail.com>

######################################################################
#### INSTALL SYSTEM DEPENDENCIES
######################################################################

# Install tools
RUN apt-get update \
  && echo 'Acquire::Retries "5";' > /etc/apt/apt.conf.d/mirror-retry \
  && apt-get -y install curl build-essential\
  && apt-get clean

######################################################################
#### SETUP BEANSTALKD
######################################################################

RUN apt-get -y install beanstalkd

######################################################################
#### RUN CONFIGURATION
######################################################################

VOLUME ["/binlog"]
EXPOSE 11300
CMD ["beanstalkd", "-V", "-p", "11300", "-b", "/binlog"]
