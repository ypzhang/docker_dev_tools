FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl \
    default-jre \
    git \
    python3 \
    python3-pip \
    wget
RUN apt-get install -y cmake pkg-config zip g++ zlib1g-dev unzip python3-numpy swig python3-dev python3-wheel
RUN pip3 install --upgrade pip
RUN pip3 install -U scikit-learn jupyter 
RUN apt-get install -y default-jdk
RUN ln -s /usr/bin/python3 /usr/bin/python

#bazel build system
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.3.2/bazel-0.3.2-installer-linux-x86_64.sh
RUN chmod +x bazel-0.3.2-installer-linux-x86_64.sh
# Run it twice, bug in bazel script?
RUN ./bazel-0.3.2-installer-linux-x86_64.sh
RUN ./bazel-0.3.2-installer-linux-x86_64.sh
ENV PATH=$PATH:/usr/local/bin

#RUN /usr/local/lib/bazel/bin/bazel-complete.bash
RUN echo "source /usr/local/lib/bazel/bin/bazel-complete.bash" >> ~/.bashrc
