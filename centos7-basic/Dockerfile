FROM jdeathe/centos-ssh:centos-7

RUN yum install -y wget vim lsof telnet htop git unzip which 

# use 163 mirror
RUN cd /etc/yum.repos.d \ 
    && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
    && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
    && yum clean all \ 
    && yum makecache 

RUN yum install -y libaio libnuma net-tools
RUN cd /home/ && wget http://uni.mirrors.163.com/mysql/Downloads/MySQL-8.0/mysql-8.0.19-1.el7.x86_64.rpm-bundle.tar




# RUN wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm \
#     && rpm -ivh mysql-community-release-el7-5.noarch.rpm \
#     && yum install mysql-server

# shanghai zone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisord.conf"]
