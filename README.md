# RailsPushQueues

This project rocks and uses MIT-LICENSE.

You can easily use Resque and/or Sidekiq workers without change.

## Set Iron configs

In the environment config file, set:

```
config.iron_token = 'X'
config.iron_project_id = 'Y'
```

## Register the workers

This is basically creating queues for each worker and setting your application as the subscriber.

```
rake queues:subscribe ImageConversionWorker
```

