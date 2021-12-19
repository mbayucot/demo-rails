require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'GetUser', type: :request do
  let(:record) { create(:user) }

  let(:valid_headers) do
    Devise::JWT::TestHelpers.auth_headers(
      { Accept: 'application/json' },
      record
    )
  end

  let(:mutation) { <<~GQL }
      query($id: ID) {
        user(id: $id) {
          id
          email
          firstName
          lastName
        }
      }
    GQL

  context 'with valid parameters' do
    it 'returns a User' do
      post graphql_url,
           params: {
             query: mutation,
             variables: {
               id: record.id
             }
           },
           headers: valid_headers
      expect(json['data']['user']).to include_json({ 'email' => record.email })
    end
  end

  context 'with no parameter' do
    it 'returns the context User' do
      post graphql_url,
           params: {
             query: mutation,
             variables: {}
           },
           headers: valid_headers
      expect(json['data']['user']).to include_json({ 'email' => record.email })
    end
  end
end
