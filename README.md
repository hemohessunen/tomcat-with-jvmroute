# tomcat-with-jvmroute
Docker Hub repository: Apache Tomcat with Engine attribute jvmRoute parameterized via environment variables

# Background

When setting up a Tomcat cluster with Apache httpd mod_jk, each Tomcat instance needs to be configured with a unique jvmRoute attribute in order to use the mod_jk's session affinity mechanism. [https://tomcat.apache.org/connectors-doc/common_howto/loadbalancers.html]

This image helps by extending the official Tomcat Docker images by setting the jvmRoute argument via environment variables.

# Versioning

The tagnames correspond to the official Tomcat Docker image tagnames. E.g. jspaalan/tomcat-with-jvmroute:9.0 uses the tomcat:9.0 as base image.

# Usage

'''
docker run --env CATALINA_OPTS="-DtomcatJvmRoute=<tomcat id>" <image name>
'''

E.g. '''docker run --env CATALINA_OPTS="-DtomcatJvmRoute=jvm2" <image name>'''

The current implementation uses a default jvmRoute parameter value jvm1.

# Implementation description

## Version specific example Dockerfile for reference

```
FROM tomcat:9.0
COPY ./server.xml /usr/local/tomcat/conf/server.xml
ENV CATALINA_OPTS="-DtomcatJvmRoute=jvm1"
CMD ["catalina.sh", "run"]
```

server.xml has been set up by modifying the Tomcat's server.xml and adding the attribute jvmRoute="{tomcatJvmRoute}" to the Engine-element.
