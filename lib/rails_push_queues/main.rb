module RailsPushQueues

  def self.queue_job(clz, *args)
    @@qcomm.queue_job(clz, *args)
  end

  class QueueComm

    attr_accessor :mq

    def initialize
      # todo: load up config stuff from config file
      @mq = IronMQ::Client.new(token: RailsPushQueues.iron_token, project_id: RailsPushQueues.iron_project_id)

    end

    def queue_job(clz, *args)
      queue_name = "railspushtest"

      if !clz.is_a?(String)
        clz = self.name
      end
      body = {"class"=>clz, "args"=>[]}
      args.each do |a|
        body["args"] << a
      end
      q = RailsPushQueues.ironmq.queue(clz)
      q.post(body.to_json)

    end

  end

end