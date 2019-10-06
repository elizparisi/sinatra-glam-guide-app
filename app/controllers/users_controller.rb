class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/products'

    else
      erb :signup
    end
  end

  post '/signup' do
    if params[:email].empty? || params[:password].empty?
      redirect '/signup'

    else
      @user = User.new(params)

      if @user.save
        session[:user_id] = @user.id

        redirect '/products'

      else
        redirect '/'
      end
    end


  end

  get '/login' do
    if logged_in?
      redirect '/products'

    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect "/users/#{@user.id}"

    else
      redirect '/login'
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])

    erb :'/users/show'
  end

  get '/logout' do

    if logged_in?
      session.clear

      redirect '/login'

    else
      redirect '/'
    end
  end
end
