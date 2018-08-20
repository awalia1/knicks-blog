require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:knicks-blog.sqlite3"

get "/" do 
	erb :home
end
