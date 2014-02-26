require_relative 'main'
require_relative 'sidekiq'

module RailsPushQueues
  class Engine < ::Rails::Engine

    initializer "RailsPushQueues.init" do |app|
      puts "CONFIG STUFF:"
      RailsPushQueues.iron_token = app.config.iron_token
      RailsPushQueues.iron_project_id = app.config.iron_project_id

      RailsPushQueues.comm = RailsPushQueues::Comm.new

    end
  end
end
