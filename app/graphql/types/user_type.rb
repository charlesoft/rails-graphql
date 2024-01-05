module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :email, String
  end
end