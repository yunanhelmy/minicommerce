module AuthHeader
  def auth_header token
    { Authorization: ["Bearer", token.token].join(" ") }
  end
end
