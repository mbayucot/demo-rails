require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'GetPost', type: :request do
  let(:user) { create(:user, :with_subscription) }
  let(:record) { create(:post) }

  let(:valid_headers) do
    Devise::JWT::TestHelpers.auth_headers({ Accept: 'application/json' }, user)
  end

  let(:mutation) { <<~GQL }
      query($id: ID!) {
        post(id: $id) {
          id
          title
          body
          slug
          subscribed
          content
          tags {
            id
            name
          }
          comments {
            id
            body
            postId
            ancestry
            children {
              id
              body
              postId
              ancestry
            }
          }
        }
      }
    GQL

  context 'with valid parameters' do
    it 'returns a Post' do
      post graphql_url,
           params: {
             query: mutation,
             variables: {
               id: record.id
             }
           },
           headers: valid_headers
      expect(json['data']['post']).to include_json({ 'title' => record.title })
    end
  end
end
