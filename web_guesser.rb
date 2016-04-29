require 'sinatra'
require 'sinatra/reloader'

rand_num = rand(101)

get '/' do
  erb :index, :locals => {:rand_num => rand_num}
end
