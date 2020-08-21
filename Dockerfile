FROM tomcat:9.0
COPY ./server.xml /usr/local/tomcat/conf/server.xml
ENV CATALINA_OPTS="-DtomcatJvmRoute=jvm1"
CMD ["catalina.sh", "run"]
