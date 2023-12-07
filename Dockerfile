FROM sujithk001/jdk-oracle
MAINTAINER sujithk001 <kumarsujith672@gmail.com>

RUN \
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key \
       | apt-key add - && \
  echo "deb http://pkg.jenkins-ci.org/debian binary/" \
       > /etc/apt/sources.list.d/jenkins.list && \
  apt-get update && \
  apt-get -y install \
          jenkins && \
  rm -rf /var/lib/apt/lists/*

VOLUME ["/root/.jenkins"]


CMD ["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war", "--webroot=/root/.jenkins/web"]

EXPOSE 8080
