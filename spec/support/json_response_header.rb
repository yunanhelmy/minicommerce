module JSONResponseReader
  def json_response
    ActiveSupport::HashWithIndifferentAccess.new(JSON(response.body))
  end

  def object_response
    Hashie::Mash.new(ActiveSupport::HashWithIndifferentAccess.new(JSON(response.body)))
  end
end
