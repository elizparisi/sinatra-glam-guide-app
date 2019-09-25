class ProductsController < ApplicationController
# this controller has full CRUD

  #index for all products
  get '/products' do
    @products = Product.all

    erb :'/products/index'
  end

  # create new product
  get '/products/new' do
  # if the user is logged in direct to create product form
  # if user is not logged in, redirect to login page

    #if logged_in?
    if logged_in
      erb :'/products/new'

    #else
    else
    #  redirect '/login'
      redirect '/login'
    end
    #end
  end

  post '/products' do
    @product = Products.new(params)

    # if the product saves, redirect to individual product page
    # if it doesn't save, redirect to '/products/new'
    if @product.save
      redirect "/posts/#{@product.id}"

    else
      redirect '/products/new'
    end
  end

  # delete product
  delete '/products' do
    # find product id, then delete that individual product
    @product = Product.find(params[:id])
    @product.destroy

    redirect '/products'
  end 


end
