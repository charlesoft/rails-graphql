module Mutations
  class CreateBlog < BaseMutation
    # arguments passed to the resolve method

    argument :title, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true

    type Types::BlogType

    def resolve(title: nil, description: nil, user_id: nil)
      Blog.create!(
        title: title,
        description: description,
        user_id: user_id
      )
    end
  end
end