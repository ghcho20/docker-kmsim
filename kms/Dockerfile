FROM ghcho20/centos:0

RUN yum install -y telnet nc

ENV PATH /root/bin:$PATH

ENV KMS_HOME /root
ENV LD_LIBRARY_PATH ${KMS_HOME}/lib:${KMS_HOME}/lib/curl

WORKDIR /root
ADD PKG_KMS_V2.1.1_0217.tar.gz .

RUN echo "${KMS_HOME}/lib" >> /etc/ld.so.conf && ldconfig

ADD kms.service /usr/lib/systemd/system
RUN ln -sf /usr/lib/systemd/system/kms.service /etc/systemd/system/multi-user.target.wants/kms.service

ADD kms.init /etc/profile.d/custom.sh
RUN chmod a+x /etc/profile.d/custom.sh

ENTRYPOINT ["/usr/sbin/init"]
