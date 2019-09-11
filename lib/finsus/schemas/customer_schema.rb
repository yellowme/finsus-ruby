module Finsus
  module Schemas
    class CustomerSchema < Dry::Validation::Contract
      schema do
        required(:name).filled(:str?)
        required(:paternal).filled(:str?)
        required(:maternal).filled(:str?)
        required(:gender).value(:int?, included_in?: [0, 1])
        required(:birthdate).value(:date?, lteq?: Time.current)
        required(:birth_entity).value(:str?)
        required(:birth_country).value(:str?)
        required(:nationality).value(:str?)
        required(:occupation).value(:int?, included_in?: 1..5)
        required(:street).value(:str?)
        required(:externalNumber).value(:str?)
        optional(:internalNumber).value(:str?)
        required(:colony).value(:str?)
        required(:municipality).value(:str?)
        required(:entity).value(:str?)
        required(:cp).value(:str?, size?: 5)
        required(:country).value(:str?)
        required(:phone).value(:str?)
        required(:email).value(:str?, format?: URI::MailTo::EMAIL_REGEXP)
        required(:latitude).value(:str?)
        required(:longitude).value(:str?)
        required(:id_key).value(:str?)
        required(:acceptance).value(:int?, included_in?: [0, 1])
        optional(:account_number).value(:str?)
        optional(:interbank_key).value(:str?)
        required(:manifest).value(:int?, included_in?: [0, 1])
        required(:image_id_front).value(:str?)
        required(:image_id_back).value(:str?)
        required(:rfc).value(:str?)
        required(:curp).value(:str?)
        optional(:image_curp).value(:str?)
        optional(:image_rfc).value(:str?)
        required(:video).value(:str?)
        optional(:image_proof_address).value(:str?)
        optional(:digital_stamp).value(:str?)
        optional(:image_signature).value(:str?)
        optional(:tdd).value(:str?, size?: 16)
        required(:beneficiary).value(:array, min_size?: 3).each do
          hash do
            required(:name).value(:str?)
            required(:domicile).value(:str?)
            required(:phone).value(:str?)
            required(:percent).value(:int?, gt?: 0, lteq?: 100)
          end
        end
      end
    end
  end
end
