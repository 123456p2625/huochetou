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
