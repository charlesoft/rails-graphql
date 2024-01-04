module Types
  class BlogDeleteMessage < Types::BaseObject
    description "A blog deleted message"

    field :detail, String, null: false
  end
end