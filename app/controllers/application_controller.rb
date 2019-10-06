require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'super_secret_beauty_session'
  end

  get "/" do
    if logged_in?

      redirect "/users/#{current_user.id}"

    else

      erb :welcome
    end
  end

  helpers do

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def authorized_to_edit?(product)
      current_user == product.user
    end
  end
end
