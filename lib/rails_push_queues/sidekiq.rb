module Sidekiq
  module Worker

    def self.included(base)
      base.extend(ClassMethods)
    end

    def logger
      Sidekiq.logger
    end

    module ClassMethods

      def perform_async(*args)
        clz = self
        RailsPushQueues.queue_job
      end
    end
  end

end
