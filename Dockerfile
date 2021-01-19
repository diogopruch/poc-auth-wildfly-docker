FROM jboss/wildfly:21.0.2.Final

# Internal variables
ARG KEYCLOAK_VERSION=12.0.1

WORKDIR $JBOSS_HOME

USER jboss:jboss

# Basic setup
RUN sed -i "s/<resolve-parameter-values>false<\/resolve-parameter-values>/<resolve-parameter-values>true<\/resolve-parameter-values>/" bin/jboss-cli.xml \
 && curl -L https://github.com/keycloak/keycloak/releases/download/$KEYCLOAK_VERSION/keycloak-oidc-wildfly-adapter-$KEYCLOAK_VERSION.tar.gz | tar zx \
 && curl -L https://github.com/keycloak/keycloak/releases/download/$KEYCLOAK_VERSION/keycloak-saml-wildfly-adapter-$KEYCLOAK_VERSION.tar.gz | tar zx \
 && bin/jboss-cli.sh --file="bin/adapter-install-offline.cli" \
 && rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current/* 

COPY standalone.xml $JBOSS_HOME/standalone/configuration

COPY poc-wildfly-auth.war $JBOSS_HOME/standalone/deployments