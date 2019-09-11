require 'json'

require 'finsus/json_api'
require 'finsus/auth'
require 'finsus/api_client'
require 'finsus/customer'
require 'finsus/responses/base_response'
require 'finsus/responses/register_response'

module Finsus
  def self.config
    yield self
  end

  def self.api_base
    @api_base
  end

  def self.api_base=(api_base)
    @api_base = api_base
  end

  def self.username
    @username
  end

  def self.username=(username)
    @username = username
  end

  def self.user_password
    @user_password
  end

  def self.user_password=(password)
    @user_password = password
  end

  def self.login_id
    @login_id
  end

  def self.login_id=(login_id)
    @login_id = login_id
  end

  def self.application_code
    @application_code
  end

  def self.application_code=(application_code)
    @application_code = application_code
  end

  def self.app_password
    @app_password
  end

  def self.app_password=(app_password)
    @app_password = app_password
  end

  def self.product
    @product
  end

  def self.product=(product)
    @product = product
  end

  def self.id_role
    @id_role
  end

  def self.id_role=(id_role)
    @id_role = id_role
  end

  def self.branch_office
    @branch_office
  end

  def self.branch_office=(branch_office)
    @branch_office = branch_office
  end
end
