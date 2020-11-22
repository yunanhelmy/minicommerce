require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  it_behaves_like "a crud model", factory: :customer_order
end
