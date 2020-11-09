FROM ubuntu:18.04
RUN apt update && \
 apt install -y rpm2cpio cpio wget gfortran gcc ragel libssl-dev make cmake g++ git autogen \
	pkg-config valgrind libboost-all-dev language-pack-en-base libboost-python-dev python3-dev \
	libsuperlu-dev libopenblas-dev sshpass zlib1g-dev\
	clang-tidy clang libboost-all-dev wget valgrind python-yaml fontconfig p7zip p7zip-rar p7zip-full\
 && rm -rf /var/lib/apt/lists/* 
RUN apt update && \
    apt install -y clang-8 clang-tidy-8
RUN apt-get update && \
    apt-get install -y make g++ make qt5-qmake qt5-default openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y install libgfortran3
RUN apt update && \
    apt -y install libeigen3-dev libsdl2-dev libglew-dev curl && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get -y install git-lfs && \
    git lfs install
RUN apt update && apt -y install sqlite3 libsqlite3-dev
RUN wget -q -O protobuf.7z https://seafile.zfn.uni-bremen.de/f/7c30abafc57a419fb568/?dl=1 && mkdir protobuf && \
 7z x protobuf.7z -o./protobuf -y
ENV LANG en_US.utf-8
