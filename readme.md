# NAS Docker infrastructure

> Requires docker-compose 1.29+

Sources of inspiration:

- Alex Kretzschmar's [Perfect Media Server](https://perfectmediaserver.com/).
- [r/selfhosted](https://old.reddit.com/r/selfhosted)
- [r/DataHoarder](https://old.reddit.com/r/DataHoarder)

## Basic ideas

This is what I'm trying to do here, even though I don't follow these rules 100% of the time.

- Each subdirectory contains one `docker-compose.yml` and handles a single service or bundle of closely related services.
- Most "large" volumes (think: logs, cache, databases) are stored in `[service]/volumes/*`. These directories are gitignored.
- Smaller volumes, generally config files (see: `caddy/Caddyfile`, `homer/assets`) are version controlled.
- **Some very large volumes' paths, mounted from other parts of the filesystem, are hardcoded currently** (backups, media files). This is annoying but I don't know how else to do it (maybe have a base path configurable as an environment variable?)
- Secrets are stored in `.env` files next to each `docker-compose.yml` and gitignored. A `.env.example` should be included as well to make it more obvious what secrets are needed.

## Native stuff

Some stuff needs to be installed bare metal, not through Docker.

### Snapraid

I'm tracking snapraid config here (`snapraid/`) but it's installed natively with [this project](https://github.com/ironicbadger/docker-snapraid).

Crontab command (`sudo crontab -e`):

```
* * * Insert here
```
