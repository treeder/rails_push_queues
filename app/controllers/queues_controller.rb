class QueuesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def receive
    p params
    body = request.body.read
    p body
    json = JSON.parse(body)
    begin
      job = json["class"].constantize.new
      # the following is for Resque 2.X
      #json["vars"].each {|k, v| job.instance_variable_set("@#{k}", v) }
      #job.work
      args = json["args"]
      job.perform(*args)
      render :json => {"got" => "it"}
    rescue Exception => ex
      render :status => 500, :json => {"error"=>"#{ex.message}"}
    end
  end

end
