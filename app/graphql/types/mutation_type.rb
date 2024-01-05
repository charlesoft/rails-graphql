# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_blog, mutation: Mutations::CreateBlog
    field :update_blog, mutation: Mutations::UpdateBlog
    field :delete_blog, mutation: Mutations::DeleteBlog

    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
