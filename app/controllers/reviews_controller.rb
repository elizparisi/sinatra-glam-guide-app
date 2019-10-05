class ReviewsController < ApplicationController

  # render reviews form
  get '/reviews/new' do

    erb :'/reviews/new'
  end

  post '/reviews' do
    review = Review.create(content: params[:content], product_id: params[:product_id], user_id: session[:user_id])

    redirect "/products/#{review.product_id}"
  end 
end
