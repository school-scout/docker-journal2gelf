FROM debian:stable

RUN apt-get update
RUN apt-get -y install git python-pip libpython2.7
RUN pip install pyinstaller graypy

RUN useradd -d /home/user -m -s /bin/bash user
WORKDIR /home/user
USER user
RUN git clone http://github.com/systemd/journal2gelf.git
WORKDIR /home/user/journal2gelf
RUN pyinstaller -F journal2gelf

ENTRYPOINT ["cp", "dist/journal2gelf", "/target/"]
