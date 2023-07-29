curl -fsSL https://get.docker.com | sh

# for Ubuntu 22
export XDG_RUNTIME_DIR=/run/user/$(id -u)
sudo apt-get install -y uidmap

dockerd-rootless-setuptool.sh install

# Set Port for docker
if ! grep -q '^net.ipv4.ip_unprivileged_port_start=80$' /etc/sysctl.conf; then
  echo 'net.ipv4.ip_unprivileged_port_start=80' | sudo tee -a /etc/sysctl.conf
fi
