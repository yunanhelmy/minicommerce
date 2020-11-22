class Users::Operation::Register < Trailblazer::Operation
  step Model(User, :new)

  step Contract::Build(constant: Users::Contract::Register)
  step Contract::Validate()
  step Contract::Persist()

  pass :generate_token!

  step :represent!

  def generate_token!(options, params:, **)
    application = Doorkeeper::Application.first
    options[:token] = Users::Repository::Token.call(options[:model].id, application: application)
  end

  def represent!(options, **)
    options[:data] = Users::Entity::Token.represent(
      options[:token],
      serializable: true,
      user: options[:model]
    )
  end

end
