module Mutations
  class CreateSubscription < BaseMutation
    field :subscription, Types::SubscriptionType, null: false
    field :errors, [Types::UserErrorType], null: true

    argument :token, String, required: true

    def resolve(token:)
      user = context[:current_user]
      begin
        Subscription.transaction do
          update_customer(user, token)
          stripe_subscription =
            create_subscription(user.stripe_customer_id, item)
          subscription =
            user.subscriptions.create!(
              stripe_subscription_id: stripe_subscription.id,
              current_period_start:
                Time.at(stripe_subscription.current_period_start),
              current_period_end:
                Time.at(stripe_subscription.current_period_end),
              status: Subscription.statuses[:active]
            )
          { subscription: subscription, errors: [] }
        end
      rescue StandardError => e
        raise GraphQL::ExecutionError.new(
                'Stripe Error',
                extensions: {
                  error: e.message
                }
              )
      end
    end

    def item
      plan = Stripe::Plan.list.data.first.id
      { price: plan }
    end

    def update_customer(user, token)
      Stripe::Customer.update(user.stripe_customer_id, { source: token })
    end

    def create_subscription(stripe_customer_id, item)
      Stripe::Subscription.create(
        { customer: stripe_customer_id, items: [item] }
      )
    end
  end
end
