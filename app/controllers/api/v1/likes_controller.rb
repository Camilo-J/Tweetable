class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet])
    @new_like = Like.new(user: current_user, tweet: @tweet)
    @new_like.save
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @like_got = Like.find_by(user: current_user, tweet: @tweet)
    @like_got.destroy
  end
end
