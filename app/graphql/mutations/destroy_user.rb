class Mutations::DestroyUser < GraphQL::Schema::Mutation
  null true

  argument :id, ID, required: true

  def resolve(id:)
    User.where(id: id).destroy_all
    true
  end
end
