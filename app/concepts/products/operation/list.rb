class Products::Operation::List < Trailblazer::Operation
  step :prepare_params
  step :list
  step :represent

  def prepare_params(options, params:, **)
    options[:keyword] = '*'
    options[:keyword] = params[:search] if params[:search]

    options[:filter] = {}
    options[:filter][:'store.id'] = params[:store_ids] if params[:store_ids]

    true
  end

  def list(options, params:, paginate: { page: 1, per_page: Pagy::VARS[:items] }, **)
    options[:repository] = Products::Repository::List.call(
      options[:keyword],
      filter: options[:filter],
      paginate: paginate
    )
  end

  def represent(options, **)
    options[:pagination] = options[:repository][:pagy]
    options[:data] = Products::Entity::Product.represent(
      options[:repository][:result],
      serializable: true
    )
  end
end
