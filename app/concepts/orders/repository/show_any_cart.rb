class Orders::Repository::ShowAnyCart
  def self.call(id, user_id)
    result = Cart.search('*', load: false, where: { id: id, user_id: user_id }).results.first
    {
      result: result
    }
  end
end
