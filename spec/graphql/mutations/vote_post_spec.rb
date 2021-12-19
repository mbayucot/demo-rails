require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe Mutations::VotePost, type: :request do
  let(:user) { create(:user) }
  let(:record) { create(:post) }
  let(:valid_attributes) { { id: record.id, weight: 1 } }
  let(:invalid_attributes) { { id: record.id, weight: nil } }

  let(:valid_headers) do
    Devise::JWT::TestHelpers.auth_headers({ Accept: 'application/json' }, user)
  end

  let(:mutation) { <<~GQL }
      mutation($id: ID!, $weight: ID!) {
        votePost(id: $id, weight: $weight) {
          post {
            id
            title
          }
        }
      }
    GQL

  context 'with valid parameters' do
    it 'votes a Post' do
      expect do
        post graphql_url,
             params: {
               query: mutation,
               variables: valid_attributes
             },
             headers: valid_headers
        record.reload
      end.to change { record.votes_for.size }.by(1)
    end

    it 'returns a Post' do
      post graphql_url,
           params: {
             query: mutation,
             variables: valid_attributes
           },
           headers: valid_headers
      expect(json['data']['votePost']['post']).to include_json(
        title: record.title
      )
    end
  end

  context 'with invalid parameters' do
    it 'does not vote a Post' do
      expect do
        post graphql_url,
             params: {
               query: mutation,
               variables: invalid_attributes
             },
             headers: valid_headers
        record.reload
      end.to change { record.votes_for.size }.by(0)
    end
  end
end
