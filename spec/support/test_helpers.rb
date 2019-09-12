require 'faker'

module TestHelpers
  LOGIN_RESPONSE = {
    'token' => 'xxxxxx',
  }.freeze

  UPDATE_RESPONSE = {
    'statusCode' => '000',
    'messageCode' => 'Update Success',
    'details' => {
      'comments' => 'Update Complete',
      'name' => 'Eduardo Hernandez Lopez',
      'date' => '28/06/2019',
      'hour' => '11:27:06',
    },
  }.freeze

  FAILED_UPDATE_RESPONSE = {
    'statusCode' => '100',
    'messageCode' => 'DATA ERROR',
    'details' => {
      'comments' => 'DATA ERROR',
      'name' => 'Eduardo Hernandez Lopez',
      'date' => '28/06/2019',
      'hour' => '11:27:06',
    },
  }.freeze

  REGISTER_RESPONSE = {
    'statusCode' => '000',
    'messageCode' => 'The User Was Registered',
    'details' => {
      'comments' => 'Registered User',
      'name' => 'Daniel',
      'date' => '28/06/2019',
      'hour' => '17:35:49',
      'accountStatus' => 'Active',
      'idAsociado' => '201-10-15',
    },
  }.freeze

  REGISTER_REQUEST = {
    name: Faker::Name.first_name,
    paternal: Faker::Name.last_name,
    maternal: Faker::Name.last_name,
    gender: Faker::Number.between(from: 0, to: 1),
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    birthEntity: Faker::Address.state,
    birthCountry: Faker::Address.country,
    nationality: Faker::Movies::StarWars.planet,
    occupation: Faker::Number.between(from: 1, to: 5),
    street: Faker::Address.street_name,
    externalNumber: Faker::Address.building_number,
    colony: Faker::Address.community,
    municipality: Faker::Address.city,
    entity: Faker::Address.state,
    cp: Faker::Number.leading_zero_number(digits: 5),
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    latitude: Faker::Address.latitude.to_s,
    longitude: Faker::Address.longitude.to_s,
    idKey: Faker::IDNumber.spanish_citizen_number,
    acceptance: Faker::Number.between(from: 0, to: 1),
    manifest: Faker::Number.between(from: 0, to: 1),
    imageIdFront: Faker::Internet.url,
    imageIdBack: Faker::Internet.url,
    rfc: 'XAXX010101000',
    curp: 'XAXX010101HDFXXX00',
    video: Faker::Internet.url,
    beneficiary: [
      {
        name: Faker::Name.name,
        domicile: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        percent: 100,
      },
    ]
  }.freeze

  RAW_LOGIN_RESPONSE = OpenStruct.new(
    body: JSON.generate(LOGIN_RESPONSE)
  ).freeze

  RAW_UPDATE_RESPONSE = OpenStruct.new(
    body: JSON.generate(UPDATE_RESPONSE)
  ).freeze

  RAW_FAILED_UPDATE_RESPONSE = OpenStruct.new(
    body: JSON.generate(FAILED_UPDATE_RESPONSE)
  ).freeze

  RAW_REGISTER_RESPONSE = OpenStruct.new(
    body: JSON.generate(REGISTER_RESPONSE)
  ).freeze
end
