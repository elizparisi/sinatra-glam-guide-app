class ProductsController < ApplicationController

  #show all products
  get '/products' do
    @products = Product.all

    erb :'/products/products'
  end

  # create new product
  get '/products/new' do
  # if the user is logged in direct to create product form
  # if user is not logged in, redirect to login page

    #if logged_in?
      erb :'/products/new'

    #else
    #  redirect '/login'
    #end
  end


end
