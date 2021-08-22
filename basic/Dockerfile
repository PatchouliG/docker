# Pull base image.
FROM ubuntu:20.04

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
ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl tzdata git htop man unzip vim wget htop linux-tools-generic gcc gdb g++ cmake tmux sysstat telnet openssh-server rsync maven

# tmux
ADD .tmux.conf ~/
# bashrc
RUN echo set -o vi > ~/.bashrc


# port
EXPOSE 22 7000 8000 8080 10000

# timezone 
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

# perf
RUN rm /usr/bin/perf && \
ln -s /usr/lib/linux-tools/*/perf /usr/bin/

# sshd
# RUN apt-get update && \
# apt-get install -y openssh-server sudo && \
# mkdir /var/run/sshd && \
# echo 'root:root' | chpasswd && \
# sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
# # SSH login fix. Otherwise user is kicked off after login
# sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# EXPOSE 22

# ssh
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo 'root:root' |chpasswd
RUN service ssh start

CMD    ["/usr/sbin/sshd", "-D"]


# common config file
# RUN git clone https://github.com/PatchouliG/config &&\
#     cp config/.bash_profile . &&\
#	 . ~/.bash_profile &&\
#	 cp config/.vimrc /root/ &&\
#	 cat config/hosts >> /etc/hosts &&\
#	 rm -rf config


