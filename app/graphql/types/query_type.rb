module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

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

    field :login, String, null: true, description: "Login a user with credentials" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.find_by(email: email)&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :whoami, Types::UserType, null: true, description: "Return looged in user"
    def whoami
      context[:current_user]
    end
  end
end
