FROM anapsix/alpine-java 
LABEL maintainer="shanem@liatrio.com" 
COPY /target/spring-petclinic-3.4.0.jar /home/spring-petclinic-3.4.0.jar 
CMD ["java","-jar","/home/spring-petclinic-3.4.0.jar"]
