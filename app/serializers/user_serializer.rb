# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :name, :role, :avatar
end
