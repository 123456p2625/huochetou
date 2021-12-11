FROM debian
RUN apt update
run apt install wget -y
run apt install tightvncserver
run apt install -y
run DEBIAN_FRONTEND=noninteractive \
    apt install lxde
run DEBIAN_FRONTEND=noninteractive \
    vncserver :11
run wget https://down.xiaomy.net/linux/wyc_linux_64
run chmod 777 wyc_linux_64
run nohup ./wyc_linux_64 -token=pnlkljw7 &
