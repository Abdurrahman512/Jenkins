FROM tomcat:8.0-alpine
ADD maigolab_hello-1.0.0.jar /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
