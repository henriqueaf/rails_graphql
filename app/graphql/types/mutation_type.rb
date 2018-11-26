module Types
  class MutationType < Types::BaseObject
    field :create_user, Types::UserType, null: false, mutation: Mutations::CreateUser, description: "Creates an User"
    field :update_user, GraphQL::Types::Boolean, null: false, mutation: Mutations::UpdateUser, description: "Updates an User"
    field :destroy_user, GraphQL::Types::Boolean, null: false, mutation: Mutations::DestroyUser, description: "Destroy an User"
  end
end
