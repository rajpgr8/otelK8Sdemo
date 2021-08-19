git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
FILE=./opentelemetry-javaagent-all.jar
if test -f "$FILE"; then
    echo "$FILE exists."
else
    curl -L https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent-all.jar --output opentelemetry-javaagent-all.jar
fi

cp ../Dockerfile .
docker build -t spring-petclinic . && \
kubectl apply -f ../OTel-deployment.yaml && \
kubectl get all
