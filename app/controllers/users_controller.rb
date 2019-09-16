class UsersController < ApplicationController
  # test signup and login routes
  #get '/signup' do
  #  erb :'users/signup'
  #end

  #get '/login' do
  #  erb :'users/login'
  #end

  get '/signup' do
  # if the user is already signed up, redirect to products
  # if the user is not signed up, they must sign up- direct to signup form
  # user helper methods

    if logged_in?
      redirect '/products'

    else
      erb :'users/signup'
    end
  end

  post '/signup' do
  # creates a new user if all credentials are provided (email and password)
  # if credentials are blank, redirect to signup

    if params[:email].empty? || params[:password].empty?
      redirect '/signup'

    else
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id

      redirect '/products'
    end
  end

  get '/login' do
  # if a user is already logged in, they will be redirected to products page
  # if the user is not logged in, send them to the login page (maybe user an error message here)

    if logged_in?
      redirect '/products'

    else
      erb :'users/login'
    end
  end

  post '/login' do
  # find user, authenticate user, create a session for a user that is logged in
  # if the user is logged in, redirect to products
  # if the user is not logged in, redirect to login page
    @user = User.find_by(email: params[:email])

    if @user && user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect '/products'

    else
      redirect '/users/login'
    end
  end

  #user show route

  get '/logout' do

    if logged_in?
      session.clear

      redirect '/users/login'

    else
      redirect '/'
    end
  end


end
