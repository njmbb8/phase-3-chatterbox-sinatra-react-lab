class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.order(:created_at).to_json
  end

  post '/messages' do
    Message.create(
      username: params[:username],
      body: params[:body]
    ).to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    Message.find(params[:id]).destroy
  end
end
