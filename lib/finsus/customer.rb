module Finsus
  class Customer < ApiClient
    def self.register(data)
      processed_data = validate_register_data(data)

      url = '/ClientDev/core/Service/registerCustomer'
      body = default_body.merge(processed_data)
      body.merge!(
        'product' => Finsus.product,
        'idRol' => Finsus.id_role
      )

      response = api_post(url, body: body, custom_headers: auth_headers)

      Responses::RegisterResponse.new(response)
    end

    def self.update(customer_id:, card_number:)
      url = '/ClientDev/core/Service/updateCustomer'
      body = default_body.merge(
        'idAsociado' => customer_id,
        'tdd' => card_number,
      )

      response = api_post(url, body: body, custom_headers: auth_headers)

      Responses::BaseResponse.new(response)
    end

    def self.validate_register_data(data)
      schema = Schemas::CustomerSchema.new
      result = schema.call(data.to_h)

      raise ArgumentError, result.errors.to_h if result.failure?

      result.to_h
    end

    private_class_method :validate_register_data
  end
end
