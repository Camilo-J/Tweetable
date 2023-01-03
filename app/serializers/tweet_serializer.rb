# frozen_string_literal: true

class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :replies_count, :likes_count, :user_id, :updated_at,
             :user_data, :likes
  def user_data
    { user_image: object.user.avatar.service_url, name: object.user.name,
      username: object.user.username }
  end
end
# ,name: object.user.name,
#     username: object.user.username
