module Mutations
  class CreateBlog < BaseMutation
    # arguments passed to the resolve method

    argument :title, String, required: true
    argument :description, String, required: true

    type Types::BlogType

    def self.visible?(context)
      super && context[:current_user].present?
    end

    def resolve(title: nil, description: nil)
      Blog.create!(
        title: title,
        description: description,
        user: context[:current_user]
      )
    end
  end
end