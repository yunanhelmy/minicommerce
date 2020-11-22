class Products::Operation::Detail < Trailblazer::Operation
  step :repository
  step :represent

  def repository(options, params:, **)
    options[:repository] = Products::Repository::Detail.call(
      params[:id]
    )
  end

  def represent(options, **)
    options[:pagination] = options[:repository][:pagy]
    options[:data] = Products::Entity::Product.represent(
      options[:repository][:result]
    )
  end
end
