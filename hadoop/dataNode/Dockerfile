FROM hadoop-base

# ssh key
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_key

CMD ["/usr/sbin/sshd", "-D"]