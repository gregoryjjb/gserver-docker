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
