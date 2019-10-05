FROM basic

# install java ssh rsync
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk &&\
	apt-get -y install ssh &&\
	apt-get -y install rsync  &&\
	rm -rf /var/lib/apt/lists/*

# java home
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

ENV HADOOP_HOME="/root/hadoop-3.1.2"
ENV PATH="${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin"

# hadoop
RUN wget https://www-us.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz &&\
	tar -xvf hadoop-3.1.2.tar.gz &&\
# delete etc
	rm -rf ${HADOOP_HOME}/etc &&\
	rm hadoop-3.1.2.tar.gz

# BIN PATH
RUN  echo 'HADOOP_HOME=/root/hadoop-3.1.2' >> ~/.bash_profile &&\
echo 'export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin' >> ~/.bash_profile

# ssh
RUN cat config/id_rsa.pub >> ~/.ssh/authorized_keys &&\
 	cp config/id_rsa.pub ~/.ssh 

CMD ["/usr/sbin/sshd","-D"]