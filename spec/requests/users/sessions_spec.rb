require 'rails_helper'

RSpec.describe 'Users::Sessions', type: :request do
  let(:password) { Faker::Internet.password }
  let!(:user) { create(:user, password: password) }
  let!(:admin) { create(:user, password: password, role: :admin) }
  let!(:editor) { create(:user, password: password, role: :editor) }

  let(:invalid_attributes) do
    { email: Faker::Internet.email, password: password, domain: 'client' }
  end

  describe 'POST /login' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        { email: user.email, password: password, domain: 'client' }
      end
      before do
        post user_session_url, params: { user: valid_attributes }, as: :json
      end

      it 'returns 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns an authorization token' do
        expect(response.headers).to have_key('Authorization')
      end
    end

    context 'with valid parameters and admin role' do
      let(:valid_attributes) do
        { email: admin.email, password: password, domain: 'admin' }
      end
      before do
        post user_session_url, params: { user: valid_attributes }, as: :json
      end

      it 'returns 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns an authorization token' do
        expect(response.headers).to have_key('Authorization')
      end
    end

    context 'with valid parameters and editor role' do
      let(:valid_attributes) do
        { email: editor.email, password: password, domain: 'admin' }
      end
      before do
        post user_session_url, params: { user: valid_attributes }, as: :json
      end

      it 'returns 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns an authorization token' do
        expect(response.headers).to have_key('Authorization')
      end
    end

    context 'with invalid parameters' do
      before do
        post user_session_url, params: { user: invalid_attributes }, as: :json
      end

      it 'returns 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(json['error']).to match(/Invalid Email or password./)
      end
    end
  end

  describe 'DELETE /logout' do
    before { delete destroy_user_session_url, as: :json }

    context 'when logged out' do
      it { expect(response).to have_http_status(:ok) }
    end
  end
end
