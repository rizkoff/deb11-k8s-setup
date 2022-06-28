FROM jenkins/jenkins:lts-jdk11

USER root
RUN groupadd -g 997 docker

RUN curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
RUN usermod -aG docker jenkins

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl; chmod +x ./kubectl; mv ./kubectl /usr/local/bin/kubectl

RUN mkdir -p /etc/kubernetes
COPY ./admin.conf /etc/kubernetes/admin.conf
RUN chmod a+r /etc/kubernetes/admin.conf

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
RUN npm install -g npm@latest

RUN apt update && apt install -y python

USER jenkins
RUN mkdir ~/.docker
COPY ./config.json ~/.docker/
#COPY ./gradle.properties ~/.gradle/

ENV KUBECONFIG=/etc/kubernetes/admin.conf
ENV GRADLE_HOME=/var/jenkins_home/.gradle

