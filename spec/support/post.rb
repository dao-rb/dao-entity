class Post < Dao::Entity::Base
  attribute :id, Integer
  attribute :name, String

  attribute :comments, Array[Comment]
end
