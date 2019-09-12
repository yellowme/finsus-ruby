module Finsus
  class Customer < ApiClient
    #
    # Método que solicita el registro de un cliente nuevo a la plataforma de Finsus
    #
    # @param [Hash] data
    # @retrun [Finsus::Response:RegisterResponse]
    #
    # @raise [Finsus::Errors::Validation]
    # @raise [Finsus::Errors::Error]
    #
    def self.register(data)
      processed_data = validate_register_data(data)

      url = '/ClientDev/core/Service/registerCustomer'
      body = default_body.merge(processed_data)
      body.merge!(
        'product' => Finsus.product,
        'idRol' => Finsus.id_role
      )

      raw_response = api_post(url, body: body, custom_headers: auth_headers)
      response = Responses::RegisterResponse.new(raw_response)

      Errors::Parser.call(response) unless response.successful?

      response
    end

    #
    # Método que solicita la actualización de un cliente en la plataforma de Finsus
    #
    # @param [String] customer_id
    # @param [String] card_number
    # @retrun [Finsus::Response:BaseResponse]
    #
    # @raise [Finsus::Errors::Error]
    #
    def self.update(customer_id:, card_number:)
      url = '/ClientDev/core/Service/updateCustomer'
      body = default_body.merge(
        'idAsociado' => customer_id,
        'tdd' => card_number,
      )

      raw_response = api_post(url, body: body, custom_headers: auth_headers)
      response = Responses::BaseResponse.new(raw_response)

      Errors::Parser.call(response) unless response.successful?

      response
    end

    #
    # Método que valida que la soilictud que se enviará para registro de nuevo
    # cliente este escrita correctamente
    #
    # @param [Hash] data
    # @retrun [Hash]
    #
    # @raise [Finsus::Errors::Validation]
    #
    def self.validate_register_data(data)
      schema = Schemas::CustomerSchema.new
      result = schema.call(data.to_h)

      if result.failure?
        raise Errors::Validation.new(details: result.errors.to_h)
      end

      result.to_h
    end

    private_class_method :validate_register_data
  end
end
