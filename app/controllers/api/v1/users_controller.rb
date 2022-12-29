class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets

    render json: { user: @user, tweets: @tweets }
  end
end
