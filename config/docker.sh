# [not recommend] Set Port for docker
# if ! grep -q '^net.ipv4.ip_unprivileged_port_start=80$' /etc/sysctl.conf; then
#   echo 'net.ipv4.ip_unprivileged_port_start=80' | sudo tee -a /etc/sysctl.conf
# fi

# allow to use port 80
sudo setcap cap_net_bind_service=ep $(which rootlesskit)


# config daemon
systemctl --user start docker
systemctl --user enable docker

# prevent docker from being killed when logout
sudo loginctl enable-linger $(whoami)