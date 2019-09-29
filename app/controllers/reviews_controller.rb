class ReviewsController < ApplicationController

  get '/reviews/new' do

    erb :'/reviews/new'
  end

  post '/reviews' do
    @product = Product.new(name: params[:product][:name], description: params[:product][:description], image_url: params[:product][:image_url], rating: params[:product][:rating])

    product.user = current_user

    params[:product][:reviews].each do |review_info|
      review = Review.new(review_info)
      review.user = current_user
      review.product = product
      review.save
    end

    product.save

    redirect '/products'
  end
end
