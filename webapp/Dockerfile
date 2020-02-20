FROM tomcat:8.5.38

COPY KEMS_20200218.war kems.p12 /tmp/

RUN rm -rf $CATALINA_HOME/webapps/ROOT && \
    unzip /tmp/KEMS_20200218.war -d $CATALINA_HOME/webapps/ROOT; rm -f /tmp/KEMS_20200218.war && \
    mkdir -p $CATALINA_HOME/webapps/ROOT/resources/fileUpload/certFile/default && \
    mv /tmp/kems.p12 $CATALINA_HOME/webapps/ROOT/resources/fileUpload/certFile/default && \
    cd "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/config/properties/" && \
    sed -i '/^hikari\.url/s/localhost/kemsdb/' conf.properties && \
    sed -i '/kemsdb:3306/s/\(amp\;\)\(zeroDate\)/\1autoReconnect=true\&amp\;\2/' conf.properties && \
    sed -i '/upload\.root\.dir/s/=.*$/=${webapp.root}\/resources/' common.properties && \
    sed -i -e '/rootLogger/s/^#\+//' -e '/rootLogger=DEBUG/s/file, console/stdout, file/' -e '/rootLogger=DEBUG/s/^/#/' log4j.properties

WORKDIR "$CATALINA_HOME"
