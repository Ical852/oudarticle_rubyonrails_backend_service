class Transaction < ApplicationRecord
    validates :order_id, presence: true
    validates :gross_amount, presence: true
end
