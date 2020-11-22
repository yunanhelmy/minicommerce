class Orders::Repository::FindCart
  def self.call(user_id)
    result = Cart.find_or_create_by(status: :shopping, user_id: user_id)
    {
      result: result
    }
  end
end
