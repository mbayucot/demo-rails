module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [Types::UserErrorType], null: true

    argument :title, String, required: false
    argument :body, String, required: false
    argument :tag_list, [String], required: false

    def resolve(title: nil, body: nil, tag_list: nil)
      post =
        context[:current_user].posts.new(
          title: title,
          body: body,
          tag_list: tag_list
        )
      Pundit.authorize context[:current_user], post, :create?
      post.save!
      { post: post }
    end
  end
end
