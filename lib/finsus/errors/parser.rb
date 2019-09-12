module Finsus
  module Errors
    class Parser
      UNAUTHORIZED = '401'
      VERIFY_CREDENTIALS = '800'
      DATA_ERROR = '100'
      SERVER_ERROR = '101'
      CORE_REJECTED = '102'
      PHONE_REGISTERED = '103'
      RFC_REGISTERED = '104'

      #
      # Método que convierte una respuesta fallida en una excepcion
      #
      # @params [Finsus::Responses::BaseResponse] response
      #
      # @raise [Finsus::Errors:Error]
      #
      def self.call(response)
        case response.status_code
        when UNAUTHORIZED || VERIFY_CREDENTIALS
          raise Unathorized
        when PHONE_REGISTERED || RFC_REGISTERED
          raise DuplicatedCustomer
        when DATA_ERROR || SERVER_ERROR
          raise Validation
        when CORE_REJECTED
          raise CoreRejection
        end
      end
    end
  end
end
