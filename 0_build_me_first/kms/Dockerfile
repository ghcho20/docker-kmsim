FROM centos:0

RUN yum install -y telnet nc

ENV KMS_HOME /root
ENV LD_LIBRARY_PATH ${KMS_HOME}/lib

ARG timezone
RUN echo ZONE="\"$timezone\"" > /etc/sysconfig/clock
RUN ln -sf /usr/share/zoneinfo/$timezone /etc/localtime

WORKDIR /root
ADD PKG_KMS_V2.0.2.tar.gz .

RUN echo "${KMS_HOME}/lib" >> /etc/ld.so.conf
RUN ldconfig

ADD kms.service /usr/lib/systemd/system
RUN ln -sf /usr/lib/systemd/system/kms.service /etc/systemd/system/multi-user.target.wants/kms.service

EXPOSE 9000 9001 9002 9004 7000 8000

ADD kms.init /etc/profile.d/custom.sh
RUN chmod a+x /etc/profile.d/custom.sh

ADD kmsdb_peer.init /root/DB
ADD sim/ ./sim/

ENTRYPOINT ["/usr/sbin/init"]
