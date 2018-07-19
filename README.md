# Sidekiq.cr Docker Dashboard

Docker container for running a [Sidekiq.cr](https://github.com/mperham/sidekiq.cr) dashboard.

#### Required environment varibles
* `DASHBOARD_SECRET` - Dashboard sessions secret
* `REDIS_HOST` - Url to redis

#### Optional environment variables
* `BASIC_AUTH_USERNAME` AND `BASIC_AUTH_PASSWORD` - If both are supplied, the dashboard will use kemal-basic-auth
