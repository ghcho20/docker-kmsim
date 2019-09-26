FROM tomcat:8.5.38

RUN rm -rf $CATALINA_HOME/webapps/ROOT

ADD KEMS_20190925.war /tmp
RUN unzip /tmp/KEMS_20190925.war -d $CATALINA_HOME/webapps/ROOT; rm -f /tmp/KEMS_20190925.war

ADD cert.p12 /usr/local/tomcat/webapps/ROOT/resources/fileUpload/certFile/default/

WORKDIR "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/config/properties/"
RUN sed -i '/^hikari\.url/s/localhost/kemsdb/' conf.properties
RUN sed -i '/kemsdb:3306/s/\(amp\;\)\(zeroDate\)/\1autoReconnect=true\&amp\;\2/' conf.properties
RUN sed -i '/upload\.root\.dir/s/=.*$/=${webapp.root}\/resources/' common.properties
RUN sed -i -e '/rootLogger/s/^#\+//' -e '/rootLogger=DEBUG/s/file, console/stdout, file/' -e '/rootLogger=DEBUG/s/^/#/' log4j.properties

WORKDIR "$CATALINA_HOME"
