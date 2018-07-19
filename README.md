# Sidekiq.cr Docker Dashboard

Docker container for running a [Sidekiq.cr](https://github.com/mperham/sidekiq.cr) dashboard.

#### Required environment varibles
* `DASHBOARD_SECRET` - Dashboard sessions secret
* `REDIS_HOST` - Url to redis
* `REDIS_PROVIDER=REDIS_HOST` - Required by sidekiq.cr [link](https://github.com/mperham/sidekiq.cr/wiki/Configuration#redis-location)

#### Optional environment variables
* `BASIC_AUTH_USERNAME` AND `BASIC_AUTH_PASSWORD` - If both are supplied, the dashboard will use kemal-basic-auth

#### Number of workers
The number of sidekiq workers defaults to 25.  To customize this override the command and specify the number of workers `/worker -c 10`. Or customize any other cli optin specified [here](https://github.com/mperham/sidekiq.cr/blob/master/src/sidekiq/server/cli.cr)