require 'rails_helper'

RSpec.describe User, type: :model do
  it_behaves_like "a crud model", factory: :user
end
