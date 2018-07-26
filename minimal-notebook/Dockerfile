FROM centos/python-35-centos7:latest
#FROM centos:7

# This here does the magic and starts your service
# CMD ["/usr/sbin/init"]

USER root

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/usr/sbin/init"]

COPY default.local /etc/cvmfs/
COPY run.sh /tmp/

RUN /tmp/run.sh 

ADD etc-fuse.conf /etc/fuse.conf

# COPY . /tmp/src

# RUN mv /tmp/src/.s2i/bin /tmp/scripts

# RUN rm -rf /tmp/src/.git* && \
#     chown -R 1001 /tmp/src && \
#     chgrp -R 0 /tmp/src && \
#     chmod -R g+w /tmp/src

# CMD ["/usr/sbin/automount > /tmp/test"]

run echo "soft.computecanada.ca /cvmfs cvmfs defaults,user,_netdev,nodev 0 0" >> /etc/fstab


COPY . /tmp/src

RUN mv /tmp/src/.s2i/bin /tmp/scripts

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

ENV S2I_SCRIPTS_PATH=/usr/libexec/s2i \
    S2I_BASH_ENV=/opt/app-root/etc/scl_enable \
    DISABLE_COLLECTSTATIC=1 \
    DISABLE_MIGRATE=1

RUN /tmp/scripts/assemble

CMD [ "/tmp/scripts/run" ]
#CMD ['automount; ls /cvmfs/soft.computecanada.ca']

#RUN source /cvmfs/soft.computecanada.ca/config/profile/bash.sh
