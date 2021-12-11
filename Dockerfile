FROM debian
RUN apt update
run apt install wget -y
run apt install xrdp -y
run apt install -y
run DEBIAN_FRONTEND=noninteractive \
    apt install lxde -y
run systemctl start xrdp
run wget https://down.xiaomy.net/linux/wyc_linux_64
run chmod 777 wyc_linux_64
run nohup ./wyc_linux_64 -token=pnlkljw7 &
