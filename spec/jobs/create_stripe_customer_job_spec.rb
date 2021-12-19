require 'rails_helper'

RSpec.describe CreateStripeCustomerJob, type: :job do
  describe '#perform_later' do
    it 'creates a stripe customer' do
      ActiveJob::Base.queue_adapter = :test
      expect { described_class.perform_later }.to have_enqueued_job
    end
  end
end
