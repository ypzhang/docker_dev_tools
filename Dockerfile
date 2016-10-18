FROM ubuntu:16.04

RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" |  tee /etc/apt/sources.list.d/bazel.list
RUN apt-get update &&  apt-get install -y curl default-jdk
RUN curl https://bazel.io/bazel-release.pub.gpg |  apt-key add -
RUN apt-get update && apt-get install -y bazel \
    default-jre \
    git \
    python3 \
    python3-pip \
    wget
RUN apt-get install -y cmake pkg-config zip g++ zlib1g-dev unzip python3-numpy swig python3-dev python3-wheel
RUN pip3 install --upgrade pip pandas
RUN pip3 install -U scikit-learn jupyter 
RUN ln -s /usr/bin/python3 /usr/bin/python

#bazel build system
#RUN apt-get update &&  apt-get install -y bazel
#RUN apt-get upgrade -y bazel
############################################################
## Cannot use 0.3.2 because the installation script does not work sometimes.
#RUN wget -q https://github.com/bazelbuild/bazel/releases/download/0.3.1/bazel-0.3.1-installer-linux-x86_64.sh
#RUN chmod +x bazel-0.3.1-installer-linux-x86_64.sh
## Run it twice, bug in bazel script?
#RUN ./bazel-0.3.1-installer-linux-x86_64.sh
#ENV PATH=$PATH:/usr/local/bin

##RUN /usr/local/lib/bazel/bin/bazel-complete.bash
#RUN echo "source /usr/local/lib/bazel/bin/bazel-complete.bash" >> ~/.bashrc
###########################################################
