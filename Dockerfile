FROM openjdk:8-jre-slim

COPY ./target/spring-petclinic-2.4.5.jar /app/spring-petclinic.jar
COPY ./opentelemetry-javaagent-all.jar  /app/opentelemetry-javaagent-all.jar

ENV OTEL_METRICS_EXPORTER=none
ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent-all.jar", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-petclinic.jar"]
