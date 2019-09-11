module TestHelpers
  LOGIN_RESPONSE = {
    'token' => 'xxxxxx'
  }.freeze

  RAW_LOGIN_RESPONSE = OpenStruct.new(
    body: JSON.generate(LOGIN_RESPONSE)
  ).freeze
end
