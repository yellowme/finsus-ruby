require 'httparty'

module Finsus
  module JsonApi
    module ClassMethods
      protected

      def default_headers
        {
          'Content-type' => 'application/json',
        }
      end

      def api_post(url, body: {}, custom_headers: {})
        headers = custom_headers.merge(default_headers)
        response = HTTParty.post(
          Finsus.api_base + url,
          body: body.to_json,
          headers: headers
        )

        JSON.parse(response.body, symbolize_names: false)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
