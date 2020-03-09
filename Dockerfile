FROM marhan/rpi-java8
MAINTAINER Matthew Harris <m.c.harris@hotmail.co.uk>

WORKDIR /data
# RUN wget https://downloads.jboss.org/keycloak/4.8.1.Final/keycloak-4.8.1.Final.tar.gz \
#       && tar xvfp keycloak-4.8.1.Final.tar.gz \
#       && rm keycloak-4.8.1.Final.tar.gz

RUN wget https://downloads.jboss.org/keycloak/9.0.0/keycloak-9.0.0.tar.gz \
      && tar xvfp keycloak-9.0.0.tar.gz \
      && rm keycloak-9.0.0.tar.gz

COPY config/keycloak-add-user.json /data/keycloak-9.0.0/standalone/configuration/keycloak-add-user.json

CMD ["/data/keycloak-9.0.0/standalone.sh", "-b", "0.0.0.0"]
EXPOSE 8080 9990
