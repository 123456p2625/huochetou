FROM debian
RUN apt update
run apt install wget -y
run wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
run apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
run apt install -y
run apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
run bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
run apt install sudo -y
Run DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AX4XfWj4TR6RoUGzFW5tislexZHhkq522QHZBZ8ElqTlrYVxHgpF9dQQQA76s_cbzAnaGw" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --root-root 
