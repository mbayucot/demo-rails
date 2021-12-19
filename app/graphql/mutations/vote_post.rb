module Mutations
  class VotePost < BaseMutation
    field :post, Types::PostType, null: false

    argument :id, ID, required: true
    argument :weight, Integer, required: true

    def resolve(id:, weight:)
      user = context[:current_user]
      post = Post.find(id)
      if weight > 1
        post.liked_by user, vote_weight: weight
      else
        Post.unliked_by user
      end
      { post: post }
    end
  end
end
