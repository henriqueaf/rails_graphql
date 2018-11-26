class Mutations::UpdateUser < GraphQL::Schema::Mutation
  null true

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    existing = User.where(id: user[:id]).first
    existing&.update(user.to_h)
  end
end
