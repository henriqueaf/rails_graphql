class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    User.create(user.to_h)
  end

  # Method that says to GraphQL that this Mutation is or not accessible
  def self.accessible?(context)
    context[:current_user]&.is_admin?
  end
end
