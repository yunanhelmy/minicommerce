class Orders::Repository::ShowCart
  def self.call(user_id)
    result = Cart.search('*', load: false, where: { user_id: user_id, status: 'shopping' })
    {
      result: result
    }
  end
end
