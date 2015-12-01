FROM ubuntu

RUN sudo apt-get update && sudo apt-get install openjdk-7-jre maven git -y && \
    git clone https://github.com/ilackarms/fenzo-layerx-brain && cd fenzo-layerx-brain && \
    mvn package && \
    mvn dependency:copy-dependencies -DoutputDirectory=libs/

CMD java -cp target/fenzo-layerx-brain-1.0-SNAPSHOT.jar:libs/* com.layerx.fenzobrain.Brain
