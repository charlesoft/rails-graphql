module Mutations
  class UpdateBlog < BaseMutation
    # arguments passed to the resolve method

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    type Types::BlogType

    def resolve(args)
      user = context[:current_user]
      blog = user.blogs.find(args[:id])
      args.delete(:id)

      blog.update(args)

      blog
    end
  end
end