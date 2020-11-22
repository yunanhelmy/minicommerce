require 'rails_helper'

RSpec.describe Store, type: :model do
  it_behaves_like "a crud model", factory: :store
end
