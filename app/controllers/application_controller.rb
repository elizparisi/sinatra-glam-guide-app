require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :session
    set :session_secret, 'super_secret_beauty_session'
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end
end
