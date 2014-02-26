$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_push_queues/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_push_queues"
  s.version     = RailsPushQueues::VERSION
  s.authors     = ["Travis Reeder"]
  s.email       = ["treeder@gmail.com"]
  s.homepage    = "http://www.iron.io"
  s.summary     = "Summary of RailsPushQueues."
  s.description = "Description of RailsPushQueues."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"
  s.add_dependency "iron_mq", ">= 5.0.0"

  s.add_development_dependency "sqlite3"
end
