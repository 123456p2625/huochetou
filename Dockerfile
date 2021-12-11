FROM debian
RUN apt update
RUN apt install --assume-yes wget tasksel
RUN [[ $(/usr/bin/lsb_release --codename --short) == "stretch" ]] && \
    apt install --assume-yes libgbm1/stretch-backports
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
RUN DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
RUN bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
RUN apt install --assume-yes task-xfce-desktop
RUN systemctl disable lightdm.service
RUN DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AX4XfWi31SV1zvnKTQzMzTnpr1NkSfx_a1cFFArw4WdzZeW7xBXD_1ddvZ7bSK7GWOsdiQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)
RUN systemctl status chrome-remote-desktop@$USER
