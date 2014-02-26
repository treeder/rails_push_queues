class QueuesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def receive
    p params
    body = request.body.read
    p body
    json = JSON.parse(body)
    job = json["class"].constantize.new
    # the following is for Resque 2.X
    #json["vars"].each {|k, v| job.instance_variable_set("@#{k}", v) }
    #job.work
    args = json["args"]
    job.perform(*args)
    render :json => {"got"=>"it"}
  end

end
