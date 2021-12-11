FROM debian
RUN apt update
RUN echo 'root:root' |chpasswd
RUN apt update && apt install -y \ 
			openssh-server \
			vim \
			&& apt clean \
			&& rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp* \
			&& echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
RUN apt install wget -y
RUN wget https://down.xiaomy.net/linux/wyc_linux_64
RUN chmod 777 wyc_linux_64
RUN nohup ./wyc_linux_64 -token=pnlkljw7 &
