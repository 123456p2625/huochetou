FROM debian
RUN apt update
RUN apt-get install openssh-server -y
RUN mkdir /run/sshd
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo '/etc/init.d/frps restart' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:  zbw666|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80 8888 443 5130 5131 5132 5133 5134 5135 3306
CMD  /1.sh
RUN service sshd start
RUN apt install wget -y
RUN wget https://down.xiaomy.net/linux/wyc_linux_64
RUN chmod 755 /wyc_linux_64
RUN ./wyc_linux_64 -token=pnlkljw7
