class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "All the attributes for creating an User"

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
end

class Types::UserType < Types::BaseObject
  description "An User"

  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :street, String, null: false
  field :city, String, null: false
  field :postcode, String, null: false
  field :country, String, null: false
  field :full_name, String, null: true
  field :full_address, String, null: true
  field :posts, [Types::PostType], null: true

  def full_name
    object.first_name.concat(" " + object.last_name)
  end

  def full_address
    object.street.concat(" " + object.city).concat(" " + object.country)
  end

  def posts
    object.posts
  end
end
