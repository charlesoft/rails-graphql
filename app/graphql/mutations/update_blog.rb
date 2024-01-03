module Mutations
  class UpdateBlog < BaseMutation
    # arguments passed to the resolve method

    argument :id, ID, required: true
    argument :user_id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    type Types::BlogType

    def resolve(args)
      user = User.find(args[:user_id])
      blog = user.blogs.find(args[:id])
      args.delete(:id)

      blog.update(args)

      blog
    end
  end
end