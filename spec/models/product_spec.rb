require 'rails_helper'

RSpec.describe Product, type: :model do
  it_behaves_like "a crud model", factory: :product
end
