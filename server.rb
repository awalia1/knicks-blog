require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'
enable :sessions

set :database, "sqlite3:knicks-blog.sqlite3"

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
    if user.password == given_password
        session[:user] = user
        redirect :forum
    else
        p 'Invalid credentials'
        redirect '/'
    end
end

get '/forum' do
    erb :forum
end

get '/signup' do
    erb :signup
end

post '/signup' do
    p params
    user = User.new(
        email: params['email'],
        name: params['fullname'],
        password: params['password']
    )

    user.save
    redirect '/'
end

get '/logout' do
    session[:user] = nil 
    p "user has logged out"
    redirect '/'
end

require './models'