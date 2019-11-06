
FROM centos:centos7
MAINTAINER andrew.zhao


ADD packages/jdk-8u231-linux-x64.tar.gz /tmp/packages
WORKDIR /tmp/packages
RUN ls | awk '{print $0}' | xargs -n1 -I {} mv  /tmp/packages/{} /usr/local/jdk
RUN chmod 777 -R /usr/local/jdk
RUN echo "x /tmp/tomcat*" >> /usr/lib/tmpfiles.d/tmp.conf

RUN mkdir -p /app/logwire

ADD {{ docker_image_logwire_local_data_path }}/{{ docker_image_logwire_exe }} /app/logwire/

RUN useradd -p {{ docker_image_logwire_password }} -U {{ docker_image_logwire_user }} && chown -R {{ docker_image_logwire_user }}:{{ docker_image_logwire_user }} /app/logwire && chmod a+x /app/logwire/{{docker_image_logwire_exe}}

USER {{ docker_image_logwire_user }}

ENV JAVA_HOME /usr/local/jdk/
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$CLASSPATH

