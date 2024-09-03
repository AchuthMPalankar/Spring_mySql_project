FROM tomcat:9-jre9
MAINTAINER "achuthmpalankar@gmail.com"
COPY ./target/my-shop-1.0.jar /usr/local/tomcat/webapps
