require 'sinatra'
require 'sinatra/reloader'

rand_num = rand(101)

get '/' do
  "The SECRET NUMBER is #{rand_num}."
end
