FROM tomcat:8.5.38

RUN rm -rf $CATALINA_HOME/webapps/ROOT

ADD KMS_Admin.war /tmp
RUN unzip /tmp/KMS_Admin.war -d $CATALINA_HOME/webapps/ROOT
RUN rm -f /tmp/KMS_Admin.war

RUN sed -i "s/localhost/kemsdb/" $CATALINA_HOME/webapps/ROOT/WEB-INF/classes/config/properties/conf.properties
