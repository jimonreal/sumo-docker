FROM cplex:12.8 as builder

ADD build/init.sh /tmp/init.sh

RUN chmod u+x /tmp/init.sh
RUN /tmp/init.sh
RUN rm -f /tmp/init.sh


FROM cplex:12.8

ENV SUMO_HOME /usr/local
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
