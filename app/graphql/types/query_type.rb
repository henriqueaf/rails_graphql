module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :user, Types::UserType, null: true, description: "Show single user" do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :post, Types::PostType, null: true, description: "Show single post" do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    field :all_posts, [Types::PostType], null: true, description: "Show all Posts"

    def all_posts
      Post.all
    end
  end
end
