FROM jenkins/jenkins:lts-jdk11

USER root

# Update base os and install OS tools we need
RUN apt-get update && apt-get -y upgrade && apt-get -y install ca-certificates curl apt-transport-https gnupg lsb-release software-properties-common && apt-get clean all

# Install AWS command line
RUN curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm -f awscliv2.zip

# Install plugins for Jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt --latest true --verbose

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

COPY Dockerfile /var/jenkins_home

USER jenkins