require 'rails_helper'

RSpec.describe ProductVariant, type: :model do
  it_behaves_like "a crud model", factory: :product_variant
end
