require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params['guess']
  cheat = params['cheat']
  if guess.nil? && cheat.nil?
    message, background_color = no_params
  elsif cheat == "true"
    message, background_color = give_cheat
  else
    message, background_color = check_guess(guess.to_i)
  end
  erb :index, :locals => {:secret_num => SECRET_NUMBER, :message => message, :color => background_color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    return "Way too high!", "#FF0000"
  elsif ((SECRET_NUMBER + 1)..(SECRET_NUMBER + 5)) === guess
    return "Too high!", "#FBBBB9"
  elsif guess < SECRET_NUMBER - 5
    return "Way too low!", "#FF0000"
  elsif ((SECRET_NUMBER - 5)...SECRET_NUMBER) === guess
    return "Too low!", "#FBBBB9"
  elsif guess == SECRET_NUMBER
    return "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}.", "#6CBB3C"
  end
end

def give_cheat
  return "The SECRET NUMBER is #{SECRET_NUMBER}.", "#FFFFFF"
end

def no_params
  return "Enter a guess.", "#FFFFFF"
end
