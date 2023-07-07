class ShippingAddress < ApplicationRecord
  belongs_to :purchase_log
end
