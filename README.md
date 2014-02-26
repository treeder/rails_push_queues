# RailsPushQueues

This project rocks and uses MIT-LICENSE.

You can easily use Resque and/or Sidekiq workers without change.

## Remove your existing worker gems

Remove resque or sidekiq from your gemfile, then do a bundle update.

## Set Iron configs

LINK TO iron config stuff, iron.json or ENV vars.

On Heroku, just add the IronMQ add on: `heroku addons:add iron_mq`

## Be sure you're app is deployed so you can set the IronMQ subscriber URL

Deploy to heroku or wherever then append `/queues/receive` to make a URL like:

```
http://yourapp.herokuapp.com/queues/receive
```

You will need this URL in the next step.

## Register the workers

This is basically creating queues for each worker and setting your application as the subscriber.

```
rake queues:subscribe\[ImageConversionWorker,http://enigmatic-falls-123.herokuapp.com/queues/receive\]
```

To verify the subscriber was added, you can run:

```
rake queues:info\[ImageConversionWorker\]
```

