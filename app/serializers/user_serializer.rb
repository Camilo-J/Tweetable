# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :name, :role, :user_image, :tweets
  def user_image
    object.avatar.service_url
  end
end
