require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
# require 'securerandom'
enable :sessions

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
# set :database, "sqlite3:knicks-blog.sqlite3"

get '/' do 
	erb :home
end

post '/' do
    email = params['email']
    given_password = params['password'] 

    # check if email exists
    # check to see if the email has a password that matches the form password
    # if they match, log in the user

    user = User.find_by(email: email)
    if user == nil
    	redirect '/'
    else
      if user.password == given_password
        session[:user] = user
        redirect :account
    	else
        p 'Invalid credentials'
        redirect '/'
    	end
	end
end

get '/account' do
	$posts = Post.all
    erb :account
end

get '/forums' do
	posts = Post.all
    erb :forums
end

post '/forums' do
	user = session[:user]
	post = Post.new(
		title: params['title'],
		author: user['first_name'],
		content: params['content'],
		user_id: user['id']
	)
	post.save
	redirect '/forums'
end

get '/signup' do
    erb :signup
end

post '/signup' do
    p params
    user = User.new(
    	first_name: params['firstName'],
        last_name: params['lastName'],
        email: params['email'],
        birthday: params['birthday'],
        password: params['password']
    )

    user.save
    redirect '/'
end

get '/search' do 
	$user = User.find_by(email:params[:search])
	# p '====='
	# p user.posts
	# p '====='
	# posts = Post.where(user_id: user)
	erb :search
end

get '/logout' do
    session[:user] = nil 
    p "user has logged out"
    redirect '/'
end

get '/logout' do
  # do log out function here
  session[:user] = nil
  session.clear
  p "user has logged out"
  redirect '/'
end

get '/confirm' do 
	erb :confirm
end

get '/delete' do
  current = session[:user].id
  user = User.find_by(id: current)
  posted = Post.where(user_id: current)
  posted.each do |post|
    post.destroy
  end
  user.destroy
  redirect '/'
end

require './models'