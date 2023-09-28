# [not recommend] Set Port for docker
if ! grep -q '^net.ipv4.ip_unprivileged_port_start=80$' /etc/sysctl.conf; then
  echo 'net.ipv4.ip_unprivileged_port_start=80' | sudo tee -a /etc/sysctl.conf
fi
