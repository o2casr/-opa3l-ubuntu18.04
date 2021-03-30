FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf-8

RUN apt-get update -q && \
 apt-get install -y rpm2cpio cpio wget gfortran gcc ragel libssl-dev make cmake g++ git autogen \
	pkg-config valgrind libboost-all-dev language-pack-en-base libboost-python-dev python3-dev \
	libsuperlu-dev libopenblas-dev sshpass zlib1g-dev \
	clang-tidy clang libboost-all-dev wget valgrind python-yaml fontconfig p7zip p7zip-rar p7zip-full \
	clang-8 clang-tidy-8 \
	make g++ make qt5-qmake qt5-default openssh-client \
	libgfortran3 \
	libeigen3-dev libsdl2-dev libglew-dev curl \
	sqlite3 libsqlite3-dev \
	libopencv-dev python3-opencv \
 && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
 && apt-get -y install git-lfs \
 && git lfs install \
 && wget -q -O protobuf.7z https://seafile.zfn.uni-bremen.de/f/7c30abafc57a419fb568/?dl=1 \
 && mkdir protobuf \
 && 7z x protobuf.7z -o./protobuf -y \
 && wget -q https://artifactory.digitalwerk.net:443/artifactory/Product-Releases/ADTF/3.9.1/Linux/x86_64/gcc/5.4/ADTF-3.9.1.tgz && mkdir ADTF && tar -xzf ADTF-3.9.1.tgz -C ADTF \
 && wget -q https://artifactory.digitalwerk.net:443/artifactory/Product-Releases/ADTF-Device-Toolbox/3.3.0/Linux/x86_64/gcc/5.4/ADTF-Device-Toolbox-3.3.0.tgz -P ADTF/addons/ && mkdir ADTF/addons/devicetoolbox && tar -xzf ADTF/addons/devicetoolbox*.tgz -C ADTF/addons/devicetoolbox/ --strip-components 1 \
 && wget -q https://artifactory.digitalwerk.net:443/artifactory/Product-Releases/ADTF-Display-Toolbox/3.5.0/Linux/x86_64/gcc/5.4/ADTF-Display-Toolbox-3.5.0.tgz -P ADTF/addons/ && mkdir ADTF/addons/displaytoolbox && tar -xzf ADTF/addons/displaytoolbox*.tgz -C ADTF/addons/displaytoolbox/ --strip-components 1 \
 && wget -q https://artifactory.digitalwerk.net:443/artifactory/dw-developer-sdk/dw/ddl/4.4.1/stable/0/package/71d4265f29f795a3fb34bf81a810f6280bd3737b/0/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/ddl.tgz && mkdir ADTF/3rdparty/ddl && tar -xzf ADTF/3rdparty/ddl.tgz -C ADTF/3rdparty/ddl \
 && wget -q https://artifactory.digitalwerk.net:443/artifactory/dw-developer-sdk/dw/ifhd/0.7.0/stable/0/package/71d4265f29f795a3fb34bf81a810f6280bd3737b/0/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/ifhd.tgz && mkdir ADTF/3rdparty/ifhd && tar -xzf ADTF/3rdparty/ifhd.tgz -C ADTF/3rdparty/ifhd \
 && wget -q https://artifactory.digitalwerk.net:443/artifactory/dw-developer-sdk/dw/a_util/5.6.1/stable/0/package/b1c1bba64e5b990636f4bcca97c3f5313c24bc3c/0/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/a_util.tgz && mkdir ADTF/3rdparty/a_util && tar -xzf ADTF/3rdparty/a_util.tgz -C ADTF/3rdparty/a_util \
 && rm -r ADTF/3rdparty/qt5/ \
 && wget https://artifactory.digitalwerk.net:443/artifactory/dw-developer-sdk/dw/Qt/5.12.9/stable/0/package/648bb5b2b9868c1adf9d7f10ac8d201e13159bb5/0/conan_package.tgz -P ADTF/3rdparty/ && mv ADTF/3rdparty/conan_package.tgz ADTF/3rdparty/qt5.tgz && mkdir ADTF/3rdparty/qt5 && tar -xzf ADTF/3rdparty/qt5.tgz -C ADTF/3rdparty/qt5 \
 && rm *.tgz \
 && rm *.7z \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

#problems during apt-get call (but should be needed by adtf) 
#RUN apt-get install -y libfontconfig1-dev
