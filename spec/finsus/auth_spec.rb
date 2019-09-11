require 'spec_helper'
require 'support/test_helpers'

RSpec.describe Finsus::Auth do
  module Dummy
    include Finsus::JsonApi
    include Finsus::Auth
  end

  before do
    allow(HTTParty).to receive(:post)
      .and_return(TestHelpers::RAW_LOGIN_RESPONSE)
  end

  describe 'method' do
    context '#token' do
      subject { Dummy.auth_headers }
      it { expect(subject).to be_an_instance_of(Hash) }
      it { expect(subject).to have_key('Authorization') }
      it { expect(subject['Authorization']).to eq(TestHelpers::LOGIN_RESPONSE['token']) }
    end
  end
end
