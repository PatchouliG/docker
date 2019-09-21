from patchoulig/basic
# install java
RUN sudo apt-get update && \
	apt-get install -y openjdk-8-jdk &&\
	apt-get -y install ssh &&\
	apt-get -y install rsync  

ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# ssh key
RUN  mkdir .ssh &&\
	ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa &&\
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# hadoop
# RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz &&\
# use local file
COPY hadoop-3.1.2.tar.gz . 
RUN	tar -xvf hadoop-3.1.2.tar.gz &&\
	rm hadoop-3.1.2.tar.gz

ENV HADOOP_HOME hadoop-3.1.2

# common config file
 RUN git clone https://github.com/PatchouliG/config &&\
	cp config/.bash_profile . &&\
	. ~/.bash_profile &&\
	cp config/.vimrc /root/ &&\
	rm -rf config

CMD ["/usr/sbin/sshd", "-D"]
