class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "All the attributes for creating an User"

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
end
