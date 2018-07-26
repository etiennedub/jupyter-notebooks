#!/bin/sh

rpm --import http://cvmrepo.web.cern.ch/cvmrepo/yum/RPM-GPG-KEY-CernVM
yum install -y http://cvmrepo.web.cern.ch/cvmrepo/yum/cvmfs-release-latest.noarch.rpm

yum install -y cvmfs cvmfs-config-default fuse fuse-libs cvmfs-auto-setup
rpm --import https://git.computecanada.ca/cc-cvmfs-public/cvmfs-config/raw/master/RPM-GPG-KEY-CC-CVMFS-1
rpm -U https://git.computecanada.ca/cc-cvmfs-public/cvmfs-config/raw/master/Packages/cvmfs-config-computecanada-latest.noarch.rpm

yum clean all


#mount -t cvmfs soft.computecanada.ca /cvmfs
