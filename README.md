# Rails Push Queues

## Why?

No worker processes/daemons, no redis, no load on your database, easier to configure, easier to use, no maintenance, boom.

You can use your existing Resque and/or Sidekiq workers without change.

This project is inspired by [Laravel's Push Queues](http://laravel.com/docs/queues#push-queues), you can watch a [great
 video demonstrating them here](http://vimeo.com/64703617). Kudos to [Taylor Otwell](http://taylorotwell.com/).

## Usage

Let's say you have a worker in your Rails app like this:

```ruby
class ImageConversionWorker
  include Sidekiq::Worker

  def perform(name, url)
    # convert some kind of image here
    puts "#{self.class.name} is about to process #{name} at #{url}"
  end
end
```

And in some controller, you want to start that worker in the background, you'd do this:

```ruby
class ImagesController < ApplicationController
  def convert
    # Queue up a job to work
    ImageConversionWorker.perform_async("somename", "http://urlofimage.com/whatever.jpg")
    render :text => "Woot woot"
  end
end
```

## Setting up IronMQ Push Queues for your workers

This is super easy, way easier than running sidekiq/resque.

### Remove your existing worker gems and add `rails_push_queues` gem.

1. Remove resque or sidekiq from your Gemfile
1. 'Add rails_push_queues' to your Gemfile
1. bundle update.

### Set Iron configs

There are a few ways to do this such as an iron.json file, Iron ENV variables or in your own config. [More details](http://dev.iron.io/mq/reference/configuration/).

On Heroku, just add the IronMQ add on: `heroku addons:add iron_mq`

### Be sure you're app is deployed somewhere with an accessible address so you can set the IronMQ subscriber URL

Deploy to heroku or wherever then append `/queues/receive` to make a URL like:

```
http://yourapp.herokuapp.com/queues/receive
```

You will need this URL in the next step.

### Register the workers as subscribers on IronMQ

This is basically creating queues for each worker and setting your application as the subscriber.

```
rake queues:subscribe\[ImageConversionWorker,http://enigmatic-falls-123.herokuapp.com/queues/receive\]
```

To verify the subscriber was added, you can run:

```
rake queues:info\[ImageConversionWorker\]
```

That's it!  Give it a try.

## More

Here's an example rails app you can try/check out to see it in action: https://github.com/treeder/rails_push_queues_test_app




