FROM cplex:12.8 as builder

ADD build/init.sh /tmp/init.sh

RUN chmod u+x /tmp/init.sh
RUN /tmp/init.sh
RUN rm -f /tmp/init.sh


FROM cplex:12.8

ENV SUMO_HOME /usr/local/sumo
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

COPY --from=builder /usr/local/sumo /usr/local/sumo
RUN apt-get update && apt-get install -y libxerces-c-dev
