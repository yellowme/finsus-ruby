require 'spec_helper'
require 'support/test_helpers'

RSpec.describe Finsus::ApiClient do
  before do
    allow(Finsus::Auth).to receive(:token).and_return(TestHelpers::LOGIN_RESPONSE['token'])
  end

  describe 'method' do
    context '#default_body' do
      subject { Finsus::ApiClient.send(:default_body) }

      it { is_expected.to be_instance_of Hash }
      it { expect(subject).to have_key('requestCredentials') }
      it { expect(subject).to have_key('brachOffice') }
      it { expect(subject['requestCredentials']).to be_instance_of Hash }
      it { expect(subject['requestCredentials']).to have_key('loginId') }
      it { expect(subject['requestCredentials']).to have_key('applicationCode') }
      it { expect(subject['requestCredentials']).to have_key('password') }
    end
  end
end
