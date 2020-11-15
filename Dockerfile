FROM ubuntu:18.04
RUN apt update && \
 apt install -y libfontconfig1-dev rpm2cpio cpio wget gfortran gcc ragel libssl-dev make cmake g++ git autogen \
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
RUN wget https://artifactory.digitalwerk.net/artifactory/Product-Releases/ADTF/3.9.1/Linux/x86_64/gcc/5.4/ADTF-3.9.1.tgz && mkdir ADTF && tar -xvzf ADTF-3.9.1.tgz -C ADTF 
RUN wget https://support.digitalwerk.net/projects/download-center/repository/raw/adtf-toolboxes/adtf-device-toolbox/release-3.3.0/devicetoolbox-3.3.0-adtf3.8.0-U1604_x64_gcc54.tgz -P ADTF/addons/ && mkdir ADTF/addons/devicetoolbox && tar -xvzf ADTF/addons/devicetoolbox*.tgz -C ADTF/addons/devicetoolbox/ --strip-components 1
RUN wget https://support.digitalwerk.net/projects/download-center/repository/raw/adtf-toolboxes/adtf-display-toolbox/release-3.5.0/displaytoolbox-3.5.0-adtf3.7.0-U1604_x64_gcc54.tgz -P ADTF/addons/ && mkdir ADTF/addons/displaytoolbox && tar -xvzf ADTF/addons/displaytoolbox*.tgz -C ADTF/addons/displaytoolbox/ --strip-components 1
RUN wget https://artifactory.digitalwerk.net/artifactory/dw-developer-sdk/dw/ddl/4.4.1/stable/package/71d4265f29f795a3fb34bf81a810f6280bd3737b/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/ddl.tgz && mkdir ADTF/3rdparty/ddl && tar -xvzf ADTF/3rdparty/ddl.tgz -C ADTF/3rdparty/ddl
RUN wget https://artifactory.digitalwerk.net/artifactory/dw-developer-sdk/dw/ifhd/0.7.0/stable/package/71d4265f29f795a3fb34bf81a810f6280bd3737b/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/ifhd.tgz && mkdir ADTF/3rdparty/ifhd && tar -xvzf ADTF/3rdparty/ifhd.tgz -C ADTF/3rdparty/ifhd
RUN wget https://artifactory.digitalwerk.net/artifactory/dw-developer-sdk/dw/a_util/5.6.1/stable/package/b1c1bba64e5b990636f4bcca97c3f5313c24bc3c/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/a_util.tgz && mkdir ADTF/3rdparty/a_util && tar -xvzf ADTF/3rdparty/a_util.tgz -C ADTF/3rdparty/a_util
RUN mv ADTF/3rdparty/qt5/ ADTF/3rdparty/qt5_ && wget https://artifactory.digitalwerk.net/artifactory/dw-developer-sdk/dw/Qt/5.12.9/stable/package/648bb5b2b9868c1adf9d7f10ac8d201e13159bb5/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/qt5.tgz && mkdir ADTF/3rdparty/qt5 && tar -xvzf ADTF/3rdparty/qt5.tgz -C ADTF/3rdparty/qt5
ENV LANG en_US.utf-8
