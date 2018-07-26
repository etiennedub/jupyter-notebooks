FROM centos/python-35-centos7:latest

USER root

RUN mkdir /tmp/test &&\
    yum install -y vim

USER 1001
