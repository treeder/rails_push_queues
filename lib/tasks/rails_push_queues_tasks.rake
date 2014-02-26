# desc "Explaining what the task does"
# task :rails_push_queues do
#   # Task goes here
# end

namespace :queues do
  task :subscribe, :clz, :host do |t, args|
    puts "task args"
    p args
  end
end