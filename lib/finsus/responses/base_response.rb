module Finsus
  module Responses
    class BaseResponse
      NO_ERROR_CODE = '000'.freeze

      attr_reader :timestamp,
                  :message

      def initialize(raw_response = {})
        parse_response(raw_response)
      end

      def successful?
        @resposne_code === NO_ERROR_CODE
      end

      private

      def parse_response(response)
        datetime = "#{response.dig('details', 'date')} #{response.dig('details', 'hour')}"

        @status_code = response['statusCode']
        @timestamp = Time.parse(datetime)
        @message = response.dig('details', 'coments')
      end
    end
  end
end
