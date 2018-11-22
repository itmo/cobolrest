FROM centos:centos7.5.1804
RUN adduser cobol
RUN yum install -y gcc gmp-devel libdb4-devel libdb-devel make
WORKDIR /tmp
COPY gnucobol-3.0-rc1.tar.xz /tmp
RUN tar -xvf gnucobol-3.0-rc1.tar.xz
WORKDIR /tmp/gnucobol-3.0-rc1
RUN ./configure --prefix=/usr
RUN make
RUN make install
RUN ldconfig
WORKDIR /tmp
RUN rm -rf gnucobol-3.0-rc1
USER cobol
WORKDIR /home/cobol
COPY *.c /home/cobol/
COPY *.cob /home/cobol/
RUN cobc  *.c
RUN cobc -Wall errnomessage.cob
RUN cobc -x -Wall tcpipserver.cob
RUN chmod a+x tcpipserver
EXPOSE 8080/tcp
CMD /home/cobol/tcpipserver localhost 8080
