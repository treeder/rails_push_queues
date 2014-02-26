module Resque

  # ex: Resque.enqueue(Archive, self.id, branch)
  def self.enqueue(clz, *args)
    RailsPushQueues.comm.queue_job(clz, args)
  end

end