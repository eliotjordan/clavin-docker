FROM java:openjdk-7-jdk

WORKDIR /opt
RUN apt-get update && apt-get install -y git maven 
RUN git clone https://github.com/Berico-Technologies/CLAVIN-rest

WORKDIR /opt/CLAVIN-rest
RUN mvn package && cp target/clavin-rest-0.2.0.jar clavin-rest.jar
ADD allCountries.zip /opt/CLAVIN-rest/allCountries.zip
RUN unzip allCountries.zip
RUN java -Xmx4096m -jar clavin-rest.jar index clavin-rest.yml

#CMD ["java","-Xmx2048m -jar clavin-rest.jar server clavin-rest.yml"]
CMD /bin/bash
