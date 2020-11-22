require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it_behaves_like "a crud model", factory: :cart_item
end
