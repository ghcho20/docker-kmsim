FROM ghcho20/centos7:systemd

ENV PATH /root/bin:$PATH
ENV KMS_HOME /root
ENV LD_LIBRARY_PATH ${KMS_HOME}/lib:${KMS_HOME}/lib/curl

COPY PKG_KMS_V2.1.2_0227_1.tar.gz kms.service kms.init ds_telnet /tmp/

RUN LD_LIBRARY_PATH= && yum install -y net-tools && yum clean all && \
    mv /tmp/ds_telnet /usr/bin/. && ln -s /usr/bin/ds_telnet /usr/bin/telnet && \
    tar xvfz /tmp/PKG_KMS_V2.1.2_0227_1.tar.gz -C /root; rm -f /tmp/PKG_KMS_V2.1.2_0227_1.tar.gz && \
    mv /tmp/kms.init /etc/profile.d/custom.sh; chmod a+x /etc/profile.d/custom.sh && \
    mv /tmp/kms.service /usr/lib/systemd/system/kms.service; \
    ln -sf /usr/lib/systemd/system/kms.service /etc/systemd/system/multi-user.target.wants/kms.service && \
    echo "${KMS_HOME}/lib" >> /etc/ld.so.conf && ldconfig

WORKDIR /root
CMD ["/usr/sbin/init"]
