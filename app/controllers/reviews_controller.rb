class ReviewsController < ApplicationController

  get '/reviews/new' do

    erb :'/reviews/new'
  end

  post '/products/:id/reviews' do
    @product = Product.find(params[:id])

    params[:product][:reviews].each do |review|

      if review[:content] != ""
        @product.reviews.create(content: review[:content], user_id: current_user.id)
      end
    end

    redirect "/products/#{@product.id}/reviews"
  end

  get '/products/:id/reviews/new' do
    @product = Product.find_by_id(params[:id])

    erb :'/reviews/new'
  end

  get '/products/:id/reviews' do
    @product = Product.find_by_id(params[:id])
    @reviews = @product.reviews

    erb :'/reviews/index'
  end
end
