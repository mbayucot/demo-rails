module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, Types::PostType.collection_type, null: true do
      argument :page, Integer, required: false
      argument :query, String, required: false
      argument :sort, String, required: false
      argument :tag, String, required: false
    end

    field :post, PostType, null: false do
      argument :id, ID, required: true, as: :id
    end

    field :users, Types::UserType.collection_type, null: true do
      argument :page, Integer, required: false
      argument :query, String, required: false
    end

    field :user, UserType, null: false do
      argument :id, ID, required: false, as: :id
    end

    field :tags, [Types::TagType], null: true do
      argument :query, String, required: false
    end

    def post(id:)
      post = ::Post
      if context[:current_user]
        post = Pundit.policy_scope!(context[:current_user], post)
        Pundit.authorize context[:current_user], post, :show?
      end
      post.friendly.find(id)
    end

    def user(id: nil)
      if id.present?
        user = Pundit.policy_scope!(::User.find(id), ::User)
        Pundit.authorize context[:current_user], user, :show?
      else
        context[:current_user]
      end
    end

    def posts(page: 1, query: nil, sort: 'asc', tag: nil)
      post = ::Post
      post = Pundit.policy_scope!(context[:current_user], post) if context[
        :current_user
      ]
      if query.present?
        post = post.search(query)
      elsif tag.present?
        post = post.tagged_with(tag)
      end
      post.page(page).order(updated_at: sort)
    end

    def users(page: 1, query: nil)
      user = Pundit.policy_scope!(context[:current_user], ::User)
      if query.present?
        user.where('email OR last_name ILIKE ?', "%#{query}%").page(page)
      end
    end

    def tags(query: nil)
      ::ActsAsTaggableOn::Tag.where('name ILIKE ?', "%#{query}%")
    end
  end
end
