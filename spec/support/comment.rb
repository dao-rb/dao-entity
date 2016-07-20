class Comment < Dao::Entity::Base
  attribute :user_name, String
  attribute :body, String
end
