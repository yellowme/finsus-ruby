require 'spec_helper'
require 'support/test_helpers'

RSpec.describe Finsus::Customer do
  before do
    allow(Finsus::Auth).to receive(:token).and_return(TestHelpers::LOGIN_RESPONSE['token'])
  end

  describe '#update' do
    context 'response is valid' do
      subject do
        described_class.update(
          customer_id: '557654',
          card_number: '4111111111111111'
        )
      end

      before do
        allow(HTTParty).to receive(:post).and_return(TestHelpers::RAW_UPDATE_RESPONSE)
      end

      it { is_expected.to be_instance_of Finsus::Responses::BaseResponse }
      it { expect(subject.successful?).to be_truthy }
    end

    context 'response is invalid' do
      subject do
        described_class.update(
          customer_id: '557654',
          card_number: '4111111111111111'
        )
      end

      before do
        allow(HTTParty).to receive(:post).and_return(TestHelpers::RAW_FAILED_UPDATE_RESPONSE)
      end

      it { expect { subject }.to raise_error Finsus::Errors::Error }
    end
  end

  describe '#register' do
    context 'request is valid' do
      subject { described_class.register(TestHelpers::REGISTER_REQUEST) }

      before do
        allow(HTTParty).to receive(:post).and_return(TestHelpers::RAW_REGISTER_RESPONSE)
      end

      it { is_expected.to be_instance_of Finsus::Responses::RegisterResponse }
    end
  end
end
