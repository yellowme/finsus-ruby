module Finsus
  module Errors
    class Validation < Error
      def initialize(msg = '', details: {})
        super(msg)
        @details = details
      end
    end
  end
end
