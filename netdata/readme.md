# Netdata

Custom dashboards go under `./dashboards` and will be mounted into Netdata's `web` directory, under the subfolder `custom`.

## GPU monitoring

See https://github.com/D34DC3N73R/netdata-glibc

Nvidia container toolkit or Nvidia docker 2 required on host machine, as well as Nvidia drivers

# Loki

Loki Docker plugin is required on host

```
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```

# Node Exporter

`node_exporter` is required on the host. I followed steps from [here to daemonize it](https://devopscube.com/monitor-linux-servers-prometheus-node-exporter/):

```bash
# Move it to /usr/local/bin
sudo mv node_exporter /usr/local/bin/

# Create a node_exporter user to run the service
sudo useradd -rs /bin/false node_exporter

# Create a node_exporter file for systemd
sudo cp ./services/node_exporter.service /etc/systemd/system/

# Reload the daemon
sudo systemctl daemon-reload
sudo systemctl start node_exporter

# Check status
sudo systemctl status node_exporter
```


# NVIDIA GPU Exporter

Install this thing: https://github.com/utkuozdemir/nvidia_gpu_exporter

```bash
# Move it to the PATH
sudo mv nvidia_gpu_exporter /usr/local/bin

# Create a nvidia_gpu_exporter user to run the service
sudo useradd -rs /bin/false nvidia_gpu_exporter

# Create a nvidia_gpu_exporter file for systemd
sudo cp ./services/nvidia_gpu_exporter.service /etc/systemd/system/

# Reload the daemon
sudo systemctl daemon-reload
sudo systemctl enable --now nvidia_gpu_exporter
