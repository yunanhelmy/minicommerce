class Cart < ApplicationRecord
  include CartSearch
  enum status: [:shopping, :checkouted]

  belongs_to :user, optional: true
  has_many :cart_items
end
