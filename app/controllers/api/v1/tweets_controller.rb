module Api
  module V1
    class TweetsController < ApplicationController
      skip_before_action :authenticate_v1_user!, only: %i[index show]
      def index
        @tweets = Tweet.all.order(updated_at: :desc).where(replied_to_id: nil)
        render json: @tweets
      end

      def show
        @tweet_got = Tweet.find(params[:id])
        @likes = Like.where(tweet_id: @tweet_got.id)
        render json: @tweet_got
      end

      def create
        @tweet_new = Tweet.new(tweet_params)
        @tweet_new.user_id = current_v1_user.id
        @tweet_new.save

        render json: @tweet_new, status: :created
      end

      def edit
        @tweet_got = Tweet.find(params[:id])
        authorize @tweet_got
        @tweet_parent = @tweet_got.replied_to
      end

      def update
        @tweet_new = Tweet.find(params[:id])
        authorize @tweet_new
        @tweet_new.update(tweet_params)

        render json: @tweet_new
      end

      def destroy
        @tweet_new = Tweet.find(params[:id])
        authorize @tweet_new
        @tweet_new.destroy
      end

      private

      def tweet_params
        params.require(:tweet).permit(:body, :replied_to_id)
      end
    end
  end
end
