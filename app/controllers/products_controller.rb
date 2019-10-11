class ProductsController < ApplicationController

  get '/products' do
      @products = Product.all

      erb :'/products/index'
  end


  get '/products/new' do

    redirect_if_not_logged_in

      erb :'/products/new'
  end

  post '/products' do
    @product = Product.new(name: params[:name], image_url: params[:image_url], rating: params[:rating], description: params[:description], user_id: current_user.id)

    if @product.save
      redirect "/products/#{@product.id}"

    else
      redirect '/products/new'
    end
  end

  get '/products/:id' do
    @product = Product.find(params[:id])

    erb :'/products/show'
  end

  get '/products/:id/edit' do
    @product = Product.find(params[:id])

    if authorized_to_edit?(@product)

      erb :'/products/edit'

    else
      redirect '/products'
    end
  end

  patch '/products/:id' do
    @product = Product.find(params[:id])

    if params[:name] !="" && params[:image_url] !="" && params[:rating] !="" && params[:description] !="" && authorized_to_edit?(@product)

      @product.update(name: params[:name], image_url: params[:image_url], rating: params[:rating], description: params[:description])

      redirect "/products/#{@product.id}"

    else
      redirect "users/#{current_user.id}"
    end
  end

  delete '/products/:id' do

      @product = Product.find(params[:id])

      if authorized_to_edit?(@product)
        @product.destroy
      end

    redirect '/products'
  end
end
