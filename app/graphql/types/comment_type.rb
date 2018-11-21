class Types::CommentType < Types::BaseObject
  description "A Comment"

  field :id, ID, null: false
  field :user_id, Int, null: false
  field :body, String, null: false
end
