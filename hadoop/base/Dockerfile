from basic
# install java ssh rsync
RUN sudo apt-get update && \
	apt-get install -y openjdk-8-jdk &&\
	apt-get -y install ssh &&\
	apt-get -y install rsync  

# java home
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

ENV HADOOP_HOME="/root/hadoop-3.1.2"
ENV PATH="${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin"

# ssh key
# RUN  mkdir .ssh &&\
#	ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa &&\
#	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY etc .

# hadoop
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz &&\
	tar -xvf hadoop-3.1.2.tar.gz &&\
# delete etc
	rm -rf ${HADOOP_HOME}/etc &&\
# mv etc
	mv -r etc ${HADOOP_HOME} &&\
	rm hadoop-3.1.2.tar.gz


CMD ["/usr/sbin/sshd", "-D"]
