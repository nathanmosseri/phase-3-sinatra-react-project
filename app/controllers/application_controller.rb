class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/phases" do
    phases = Phase.all
    phases.to_json
  end

  get '/phases/:id' do
    phase = Phase.find(params[:id])
    phase.to_json
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

  get '/posts/:user_id' do
    posts = Post.where(user_id: params[:user_id])
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

  get '/followers/:followers_id' do
    #puts params[followers_id: :followers_id]
    followers = Follower.where(followers_id: params[:followers_id])
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

  # get '/followed-posts' do
  #   posts = User.left_outer_joins(:posts).select('posts.*, count(posts.id) as post_count').group('users.id')
  #   posts.to_json
  # end

  get '/namedPosts' do
    # posts = User.left_outer_joins(:posts).select('posts.*, count(posts.id) as post_count').group('users.id')
    posts = Post.all
    posts.to_json(include: :user)
  end

  get '/phases-with-posts/:id' do 
    posts = Phase.find(params[:id])
    posts.to_json(include: {posts: {include: :user}})
  end

  get '/users-by-name/:name' do
    user = User.where(name: params[:name])
    user.to_json(include: :posts)
  end

end
