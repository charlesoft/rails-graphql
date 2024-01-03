# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_blog, mutation: Mutations::CreateBlog

    field :update_blog, mutation: Mutations::UpdateBlog
  end
end
