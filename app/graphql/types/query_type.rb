# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :blogs, [Types::BlogType], null: true, description: "Fetches all the blogs"
    def blogs
      Blog.preload(:user)
    end
  end
end
