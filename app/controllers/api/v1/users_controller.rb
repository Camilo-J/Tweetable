module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_v1_user!, only: [:show]
      def show
        @user = User.find(params[:id])
        @tweets = @user.tweets

        render json: { user: @user, tweets: @tweets }
      end
    end
  end
end
