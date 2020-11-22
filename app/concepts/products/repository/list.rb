class Products::Repository::List
  def self.call(keyword, filter:, paginate:)
    results = Product.search(
      keyword,
      where: filter,
      load: false,
      fields: [:name],
      operator: "and",
      misspellings: false,
      order: { _score: :desc },
      page: paginate[:page],
      per_page: paginate[:per_page],
    )

    pagy = Pagy.new_from_searchkick(results,
      items: paginate[:per_page],
      page: paginate[:page],
      count: results.total_count
    )

    {
      result: results,
      pagy: pagy
    }
  end
end
