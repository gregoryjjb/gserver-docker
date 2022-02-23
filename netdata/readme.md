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
sudo nano /etc/systemd/system/node_exporter.service

# Fill it with the content below

# Reload the daemon
sudo systemctl daemon-reload
sudo systemctl start node_exporter

# Check status
sudo systemctl status node_exporter
```

Service file (`node_exporter.service`):

```
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --collector.textfile.directory /var/lib/node_exporter/textfiles

[Install]
WantedBy=multi-user.target
```
