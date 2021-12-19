module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :destroy_post, mutation: Mutations::DestroyPost
    field :create_comment, mutation: Mutations::CreateComment
    field :vote_post, mutation: Mutations::VotePost
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :destroy_user, mutation: Mutations::DestroyUser
    if Flipper.enabled? :subscription
      field :create_subscription, mutation: Mutations::CreateSubscription
    end
  end
end
