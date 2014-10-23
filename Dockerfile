FROM        ubuntu:14.04
MAINTAINER  Maxime Tricoire <max.tricoire@gmail.com> (@maxleiko)

RUN         mkdir -p /root/workspace

WORKDIR     /root/workspace

RUN         apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886
RUN         echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu/ trusty main" > /etc/apt/sources.list.d/java.list
RUN         echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN         echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN         apt-get update

# Install Oracle JDK8 & Haxe
RUN         echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN         apt-get install -y oracle-java8-installer oracle-java8-set-default g++ gcc-4.8-multilib g++-4.8-multilib neko

ADD         haxe /usr/lib/haxe
ADD         haxelib /usr/bin/haxelib
RUN         ln -s /usr/lib/haxe/haxe /usr/bin/

RUN         mkdir -p /usr/share/haxe/lib
RUN         echo "/usr/share/haxe/lib" > /root/.haxelib

RUN         haxelib install hxjava
RUN         haxelib install hxcpp

CMD         ["haxe", "build.hxml"]
