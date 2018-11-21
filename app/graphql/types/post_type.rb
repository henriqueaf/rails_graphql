class Types::PostType < Types::BaseObject
  description "A Post"

  field :id, ID, null: false
  field :user_id, Int, null: false
  field :body, String, null: false
  field :comments, [Types::CommentType], null: true

  def comments
    object.comments
  end
end
