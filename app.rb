require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/birthday_countdown.rb'

class BirthdayGreeter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/countdown' do
    session[:user_name] = params[:user_name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    redirect "/show_countdown"   
  end

  get "/show_countdown" do
    day = session[:day].to_i
    month = session[:month].to_i
    @days_to_birthday = BirthdayCountdown.new().days_to_birthday(day, month)
    @user_name = session[:user_name]
    redirect "/happy_birthday" if @days_to_birthday == 0
    erb(:countdown)
  end

  get "/happy_birthday" do
    @user_name = session[:user_name]
    erb(:happy_birthday)
  end

end
