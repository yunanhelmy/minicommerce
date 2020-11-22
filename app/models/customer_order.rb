class CustomerOrder < ApplicationRecord
  enum status: [:checkout, :confirmed, :shipped]

  belongs_to :cart, optional: true
  belongs_to :user, optional: true
end
