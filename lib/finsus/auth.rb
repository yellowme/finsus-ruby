module Finsus
  module Auth
    TOKEN_EXPIRATION_TIME = 5 * 60
    private_constant :TOKEN_EXPIRATION_TIME

    module ClassMethods
      def auth_headers
        {
          'Authorization' => token
        }
      end

      private

      def token
        return @token unless need_update?

        url = '/LoginTDev/core/Service/login'
        body = {
          'user' => Finsus.username,
          'pass' => Finsus.user_password
        }

        response = api_post(url, body)
        @token = response['token']
        @expires_at = Time.now + TOKEN_EXPIRATION_TIME

        return @token
      end

      def need_update?
        @token.nil? || @expires_at.nil? || Time.now > @expires_at
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
