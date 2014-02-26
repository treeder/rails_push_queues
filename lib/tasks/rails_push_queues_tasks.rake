# desc "Explaining what the task does"
# task :rails_push_queues do
#   # Task goes here
# end

namespace :queues do
  task :subscribe, [:clz, :url] do |t, args|
    mq = IronMQ::Client.new
    q = mq.queue(args.clz.to_s)
    q.add_subscriber(url: args.url)
  end

  task :info, [:clz] do |t, args|
    mq = IronMQ::Client.new
    q = mq.queue(args.clz.to_s)
    p q.info
  end
end
