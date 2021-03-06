require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it { expect(subject).to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:stripe_subscription_id) }
  end
end
