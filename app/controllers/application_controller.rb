class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/phases" do
    phases = Phase.all
    phases.to_json
  end

  get '/users' do 
    users = User.all 
    users.to_json
  end

  get '/users/:id' do 
    user = User.find(params[:id])
    user.to_json
  end

  get '/posts' do
    posts = Post.all 
    posts.to_json
  end

  get '/comments' do
    comments = Comment.all 
    comments.to_json
  end

  get '/followers' do 
    followers = Follower.all 
    followers.to_json
  end

  post '/users' do
    new_user = User.create(
      name: params[:name],
      password: params[:password],
      bio: params[:bio],
      email: params[:email],
      links: params[:links],
      phase_id: params[:phase_id]
    )
    new_user.to_json
  end

end
