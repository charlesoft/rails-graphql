# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :blogs, [Types::BlogType], null: true, description: "Fetches all the blogs"
    def blogs
      Blog.preload(:user)
    end

    field :blog, Types::BlogType, null: false, description: "Fetches a blog by the given ID" do
      argument :id, ID, required: :true
    end
    def blog(id:)
      Blog.find(id)
    end
  end
end
