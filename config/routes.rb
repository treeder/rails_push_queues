Rails.application.routes.draw do
  post 'queues/receive', to: 'queues#receive'
end
