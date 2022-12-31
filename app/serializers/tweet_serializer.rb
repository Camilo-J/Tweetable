# frozen_string_literal: true

class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :replies_count, :likes_count, :user_id, :created_at, :updated_at,
             :user_image, :likes
  def user_image
    object.user.avatar.service_url
  end
end
