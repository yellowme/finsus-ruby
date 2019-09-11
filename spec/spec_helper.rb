# require 'webmock/rspec'
require 'rspec'
require 'simplecov'

require 'finsus'

SimpleCov.start

RSpec.configure do |config|
  config.before(:all) do
    Finsus.api_base = 'http://tests.com'
    Finsus.username = 'user'
    Finsus.user_password = 'password'
    Finsus.login_id = 'fuIlCrBjoY'
    Finsus.application_code = 'SG5qHu8EQp'
    Finsus.app_password = 'RKpJoGfW9G'
    Finsus.product = 'finGem'
    Finsus.id_role = 'user'
    Finsus.branch_office = '5'
  end
end
