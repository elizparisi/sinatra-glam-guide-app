class UsersController < ApplicationController

  # if the user is already signed up, redirect to reviews
  # if the user is not signed up- sign up, direct to user form
  # use helper methods

  get '/signup' do
    erb :'users/signup'
  end

  get '/login' do
    erb :'users/login'
  end


end
