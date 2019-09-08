FROM registry.docker-cn.com/tensorflow/tensorflow:1.12.0-gpu-py3

ENV DEBIAN_FRONTEND noninteractive

ENV PIP_INDEX_URL https://mirrors.aliyun.com/pypi/simple/
ENV DATA_ROOT_DIR="DATA_ROOT_DIR"


ADD sources.list /etc/apt/sources.list

ARG USE_PYTHON_3_NOT_2=True
ARG _PY_SUFFIX=${USE_PYTHON_3_NOT_2:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

RUN set -ex; \
    apt-get clean all; \
    apt-get update; \
    apt-get install -y   --allow-unauthenticated \
                    vim less zsh curl git \
                    ${PYTHON}-dev \
                    ${PYTHON}-pip \
                    cmake \
                    cuda-libraries-dev-9-0 \
                    libopencv-dev \
                    libcudnn7=7.1.4.18-1+cuda9.0 \
                    libcudnn7-dev=7.1.4.18-1+cuda9.0; \
    apt-get clean all

RUN cd /usr/bin \
	&& ln -f -s idle3 idle \
	&& ln -f -s pydoc3 pydoc \
	&& ln -f -s python3 python \
	&& ln -f -s python3-config python-config

RUN ${PIP} install --no-cache-dir --upgrade \
        pip \
        setuptools

RUN ${PIP} install -i ${PIP_INDEX_URL} \
                Cython \
                imgaug \
                opencv-python \
                lmdb \
                torchvision \
                packaging \
                pyyaml \
                requests \
                tqdm \
                mlflow \
                tabulate \
                pillow \
                argparse-color-formatter \
                colorama \
                cityscapesscripts \
                grpcio-tools \
                googleapis-common-protos

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

