module Finsus
  class ApiClient
    include JsonApi
    include Auth

    protected

    def self.default_body
      {
        'requestCredentials' => {
          'loginId' => Finsus.login_id,
          'applicationCode' => Finsus.application_code,
          'password' => Finsus.app_password
        },
        'brachOffice' => Finsus.branch_office
      }
    end
  end
end
