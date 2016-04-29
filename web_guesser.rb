require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"].to_i
  message  = check_guess(guess)
  erb :index, :locals => {:secret_num => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif ((SECRET_NUMBER + 1)..(SECRET_NUMBER + 5)) === guess
    "Too high!"
  elsif guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif ((SECRET_NUMBER - 5)...SECRET_NUMBER) === guess
    "Too low!"
  elsif guess == SECRET_NUMBER
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}."
  end
end
