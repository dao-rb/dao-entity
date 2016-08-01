class Post < Dao::Entity::Base
  include Dao::Entity::Dirty

  attribute :id, Integer
  attribute :name, String

  attribute :comments, Array[Comment]
end
