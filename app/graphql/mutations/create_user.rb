module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: true
    field :errors, [Types::UserErrorType], null: true

    argument :email, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :password, String, required: false
    argument :role, String, required: false

    def resolve(
      email: nil,
      first_name: nil,
      last_name: nil,
      password: nil,
      role: nil
    )
      user =
        User.new(
          email: email,
          first_name: first_name,
          last_name: last_name,
          password: password,
          role: role
        )
      Pundit.authorize context[:current_user], user, :create?
      user.save ? { user: user } : { errors: pretty_errors(user.errors) }
    end
  end
end
