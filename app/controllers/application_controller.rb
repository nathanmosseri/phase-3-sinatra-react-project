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
    users = User.all.order(:name)
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

  post '/posts' do 
    post = Post.create(
      body: params[:body],
      link: params[:link],
      user_id: params[:user_id],
      likes: params[:likes]
    )
    post.to_json
  end

  delete '/delete-posts/:id' do
    post = Post.find(params[:id])
    post.destroy
    post.to_json
  end

  get '/posts/:user_id' do
    posts = Post.where(user_id: params[:user_id]).order(created_at: :DESC)
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
    posts = Post.all.order(created_at: :DESC)
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

  get '/posts-by-likes' do 
    posts = Post.all.order(likes: :DESC)
    posts.to_json
  end

end
