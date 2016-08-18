FROM ubuntu:16.04

MAINTAINER Sercan Karaoglu <hsercankaraoglu@gmail.com>

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/* && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer
  
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/oracle-jdk8-installer 

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle