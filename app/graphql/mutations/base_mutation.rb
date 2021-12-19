module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def pretty_errors(errors)
      errors.map do |error|
        path = ['attributes', error.attribute.to_s.camelize(:lower)]
        { path: path, message: error.full_message }
      end
    end
  end
end
