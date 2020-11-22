class Products::Repository::Detail
  def self.call(id)
    Product.find(id)
    results = Product.search(
      '*',
      where: { id: id },
      load: false,
    )

    {
      result: results.first
    }
  end
end
