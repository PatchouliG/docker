# Pull base image.
FROM ubuntu:16.04

ENV LANG=C.UTF-8

# Add files.
#ADD bashrc /root/.bashrc
# ADD ~/.gitconfig /root/.gitconfig
# ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Install.
RUN \
  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# sshd
 RUN apt-get update && \
 apt-get install -y openssh-server sudo && \
 mkdir /var/run/sshd && \
 echo 'root:root' | chpasswd && \
 sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
 # SSH login fix. Otherwise user is kicked off after login
 sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
 EXPOSE 22

# common config file
run git clone https://github.com/PatchouliG/config &&\
	cp config/.bash_profile . &&\
	. ~/.bash_profile &&\
	cp config/.vimrc /root/ &&\
	rm -rf config/

# Define default command.
CMD ["/usr/sbin/sshd", "-D"]
