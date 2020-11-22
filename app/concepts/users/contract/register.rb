require "reform/form/active_model/validations"

class Users::Contract::Register < Reform::Form
  include Reform::Form::ActiveModel::Validations

  property :email
  property :password
  property :password_confirmation

  validates_uniqueness_of :email
end
