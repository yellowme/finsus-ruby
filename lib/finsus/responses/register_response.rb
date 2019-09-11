module Finsus
  module Responses
    class RegisterResponse < BaseResponse
      attr_reader :account_status,
                  :associated_id

      def initialize(raw_response = {})
        super(raw_response)
        @account_status = raw_response.dig('details', 'account_status')
        @associated_id = raw_response.dig('details', 'id_asociado')
      end
    end
  end
end
