require 'rails_helper'

RSpec.describe Cart, type: :model do
  it_behaves_like "a crud model", factory: :cart
end
