
FROM registry.docker-cn.com/library/ubuntu:16.04
WORKDIR /tianshi

ADD . /tianshi/

ADD sources.list /etc/apt/sources.list

ENV PIP_INDEX_URL https://mirrors.aliyun.com/pypi/simple/
ENV LANG=C.UTF-8 

RUN set -ex; \
    apt-get clean all; \
    apt-get update; \
    apt-get install -y  --allow-downgrades\
                    curl git vim\
                    python-dev \
                    python-pip \
                    cmake ;

# sshd
 RUN apt-get update && \
 apt-get install -y openssh-server sudo && \
 mkdir /var/run/sshd && \
 echo 'root:root' | chpasswd && \
 sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
 # SSH login fix. Otherwise user is kicked off after login
 sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
