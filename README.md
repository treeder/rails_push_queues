# RailsPushQueues

This project rocks and uses MIT-LICENSE.

You can easily use Resque and/or Sidekiq workers without change.

## Set Iron configs

LINK TO iron config stuff, iron.json or ENV vars.

On Heroku, just add the IronMQ add on: `heroku addons:add iron_mq`


## Register the workers

This is basically creating queues for each worker and setting your application as the subscriber.

```
rake queues:subscribe\[ImageConversionWorker,http://enigmatic-falls-123.herokuapp.com/queues/receive\]
```

To verify the subscriber was added, you can run:

```
rake queues:info\[ImageConversionWorker\]
```

