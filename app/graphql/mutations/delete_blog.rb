module Mutations
  class DeleteBlog < Mutations::BaseMutation
    argument :id, ID, required: true

    field :message, Types::BlogDeleteMessage, null: false

    def resolve(id:)
      blog = Blog.find(id)

      if blog.destroy
        {message: {detail: "Blog deleted with sucess."}}
      else
        {message: {detail: "Something went wrong. Please try in a few minutes."}}
      end
    end
  end
end